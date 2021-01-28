Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D943F3079B1
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:29:48 +0100 (CET)
Received: from localhost ([::1]:34264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59Ex-0004Im-VV
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l59Dh-0003eP-Kn
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:28:29 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:34553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l59Df-0007QA-3k
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:28:29 -0500
Received: by mail-ed1-x52d.google.com with SMTP id d22so7078925edy.1
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 07:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FW8IrmaDYnWKdgHUXE+sN4Ii+nBJ56wUbQ4Ky9VXiQ0=;
 b=lDPS3YDbrJYkyQx+5k2w6iVRdRqsFjM+OSB0/fsWeIHwtmEwEnAPohHDlauqMf6n57
 9diZ/RRoIspYJg4cXbd88cwJHltkqZ84k4aIkb7hDfxa/tBAo4KMZ/iXpeXhntzH8Ib7
 f+tIyW2vwZVHk0Kb4Vvvl9tbclrxISZRhlsNw9AtAFyamH4fhc/d1ykEvA6f9MklszyH
 gNlnWsrBVa7iWg4AGsXzZpM4awpBUnWcqRgr7GC5GN/oH95KUsYaIJ7KW6AVIK93YuEu
 n7KgOSMZJQ+SfE3kZWg/3sOfUAjq5vcSAzk6OaezcQuCPMGVEq0VxSM3iPafzQ8QQdqc
 RT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FW8IrmaDYnWKdgHUXE+sN4Ii+nBJ56wUbQ4Ky9VXiQ0=;
 b=RaLhUyhrYkW175iT1zYszBQfzG2FNcq4GZVWrjk+AdLuABNCEUX7Y+G2rWq+RAylW3
 fCXhSbTPqv+HyfVhQ4vbo+8uy0JAHyhqXmaqpucOFHTjnEwYwhgqG6h7+WB93H8a2gaE
 pAOc2FyUmeW1xbrLlsADyFNTEjsYhOCu10mbAY0mS2Dd6HI0aanWPImRrkrxP4gj/zcA
 aHG/mamUcCsnphFnC+5pxZXfQj4MYYjKYwDqrgcXhgvoIL5MLFzZCiIrpoNot6NMashW
 EiYDAY71lrEJuR1bLvkf+pP0CSnle8RDPU1T0YBN1jlWMA6Mh62rPWrz3IDTYHWVEFgv
 ZW3g==
X-Gm-Message-State: AOAM532RDNnQvkR0HHZhlWUBJFT6TJI7vYciTMUuJqNlab1/fTPmbXCF
 a9T0TJsBmJN6Ma2ynmoZ+uKmnMpVUpVSks7kbtvaFw==
X-Google-Smtp-Source: ABdhPJyb1X0gN+TZgnJ//UXOa7yuRQpUKvSBi/YBBeSwoRX/2wRfzzyWe7Y/bY6U/axogZzvsq/PdWMSIknxS25ZHPo=
X-Received: by 2002:aa7:c88a:: with SMTP id p10mr54516eds.204.1611847705567;
 Thu, 28 Jan 2021 07:28:25 -0800 (PST)
MIME-Version: 1.0
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-7-agraf@csgraf.de>
In-Reply-To: <20210120224444.71840-7-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 15:28:13 +0000
Message-ID: <CAFEAcA8Tm2d+Wmd0X7RddfBHPez_Tjk71YFgXNOo2gycxq32JQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/11] hvf: Simplify post reset/init/loadvm hooks
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
>
> The hooks we have that call us after reset, init and loadvm really all
> just want to say "The reference of all register state is in the QEMU
> vcpu struct, please push it".
>
> We already have a working pushing mechanism though called cpu->vcpu_dirty,
> so we can just reuse that for all of the above, syncing state properly the
> next time we actually execute a vCPU.
>
> This fixes PSCI resets on ARM, as they modify CPU state even after the
> post init call has completed, but before we execute the vCPU again.
>
> To also make the scheme work for x86, we have to make sure we don't
> move stale eflags into our env when the vcpu state is dirty.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>

What's the difference between HVF and KVM that means this code
doesn't have the same structure the KVM code does here?

thanks
-- PMM

