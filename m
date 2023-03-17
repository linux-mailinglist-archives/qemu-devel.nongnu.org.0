Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4B46BF64B
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 00:26:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdJR4-0006kG-9l; Fri, 17 Mar 2023 19:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1pdJR2-0006jt-7z
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 19:24:32 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1pdJR0-0004H8-Gl
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 19:24:31 -0400
Received: by mail-ed1-x52e.google.com with SMTP id ek18so26181131edb.6
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 16:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112; t=1679095468;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dH3p97h/EAUFoh5IOOrT0ILgfSJ+vnvdG3hCCHLcdPk=;
 b=CB5rN7p8rFRCRvY5heaLi0N3iyL9Yfnh89EEsaCcJRzuwQYnAKhWOLpaCw99+aze3X
 J5H5HczKYqVck1WhFuv5kLxBZ6STWx+mOpNxub8UIBH+GflascjIQFo258I29Cp7vJ4a
 yVUGIaahPSJ9cDKGYL/gXoqw4ozSEe9p/HXZPPN9fz1AzaIukY09ch/84A0A+sQt19MD
 A8bU9H9FczE1WpAMT8gKyIcoXoK/CroJQmmM2mn3wDOHJKSHExFezhOj1gF0gpvkqaTp
 jnsJBv8KVzSSOc9aml8ORWrkZPVSmTtnuCeXHI37LddH0HREhKF2TdHOm6lusZo5qnHE
 lL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679095468;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dH3p97h/EAUFoh5IOOrT0ILgfSJ+vnvdG3hCCHLcdPk=;
 b=7OQYctfcXYN4chbYJRKoetljAFLzNbANXPVUxUDKMQQIKWCsaLnfcIf6P9N5xJBRq8
 uR6SYF5uZ2050HWQRaqYddKJ/NLpRul6BEQeQhgmPHoDMwR891gbquJWWNsmgziBVsjU
 e8c1nt1UmsSdNOrtOeQaFYXCC+O/k0Up0EhPxWu7FZqQFGgSpX8Q9+yw8Aj0rYUbn5wl
 2O+o7yDTgZ1I90JeXR3RseA2kjRiPhXSH04VqHqc7JPhkKYklpU08X3NJtzCJzxDVc0P
 sr0nJZMur2sIw1fTQHJH27n+owtBPNLbtekdpSYJJjqWagKYevxAZnJggKtj6E8TW+P3
 fmUg==
X-Gm-Message-State: AO0yUKUWFN6zcxEnQf+3zFGjkhhwcL7joGuvmU9oKk5+5JNa573PB/AF
 Jdh4Z1+QlphyAPiqZ2lBsTUuVQ==
X-Google-Smtp-Source: AK7set/mJIqr/U13r2QyXOZORufmh01bLIdxodSYuC1t6rQ10fMbZhGFfBxZH7MAR527zgMYoHdvFA==
X-Received: by 2002:a17:906:5393:b0:92f:7c42:8631 with SMTP id
 g19-20020a170906539300b0092f7c428631mr1033339ejo.16.1679095468652; 
 Fri, 17 Mar 2023 16:24:28 -0700 (PDT)
Received: from smtpclient.apple ([188.25.247.154])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a17090624c300b0092a59ee224csm1457961ejb.185.2023.03.17.16.24.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Mar 2023 16:24:28 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.2\))
Subject: Re: [PATCH] Revert "docs/about/deprecated: Deprecate 32-bit arm hosts
 for system emulation"
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <20230317165504.613172-1-thuth@redhat.com>
Date: Sat, 18 Mar 2023 01:24:26 +0200
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?utf-8?Q?=22Daniel_P_=2E_Berrang=C3=A9=22?= <berrange@redhat.com>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Transfer-Encoding: 7bit
Message-Id: <A0D0927D-9A93-4E51-B69E-A1BD926D66F7@livius.net>
References: <20230317165504.613172-1-thuth@redhat.com>
To: Thomas Huth <thuth@redhat.com>
X-Mailer: Apple Mail (2.3696.120.41.1.2)
Received-SPF: none client-ip=2a00:1450:4864:20::52e;
 envelope-from=ilg@livius.net; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> On 17 Mar 2023, at 18:55, Thomas Huth <thuth@redhat.com> wrote:
> 
> This reverts commit 1d0a8eba38cdddd028ea02c6e0b68f0a4c9a3cbf...

Thank you, Thomas!

Liviu


