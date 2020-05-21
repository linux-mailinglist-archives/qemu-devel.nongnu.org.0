Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A4E1DD222
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 17:41:06 +0200 (CEST)
Received: from localhost ([::1]:45464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbnJh-0001xG-De
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 11:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jbnId-0000iY-C9
 for qemu-devel@nongnu.org; Thu, 21 May 2020 11:39:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47380
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jbnIc-0000Rm-NH
 for qemu-devel@nongnu.org; Thu, 21 May 2020 11:39:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590075598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TLBmkzvqLo/2xqTgB3wKYah0MktTnKkMGLnj++PbV5c=;
 b=Z0yERlQkHz3keNOTfblHY4i4ljfhUIYM5+uXdeKmEsz3EQVjciVmYT2GkNTUp9OWwx6CmP
 C96RaCkpJAm6zxbu9cKb5zvAPX/89zRAAHp0ARLqZlBZWjPTJi+H62FBAuU/d0buP99J2K
 hW4QOY4nDtXuOJKzjZXc+fZblkmDOSA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-gpDer4swMAWSp4PxUtYp4w-1; Thu, 21 May 2020 11:39:54 -0400
X-MC-Unique: gpDer4swMAWSp4PxUtYp4w-1
Received: by mail-wr1-f71.google.com with SMTP id c14so1919983wrm.15
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 08:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TLBmkzvqLo/2xqTgB3wKYah0MktTnKkMGLnj++PbV5c=;
 b=cOdrDM6GGlpbXD+qYwmDMk1Q7XLnC4gXNvJY3NRF8so2dRbMD1P7CIu1/nBGlP0KDq
 doLtCeVx6UQMTd4h+HQ9KkIEjmNxtVQWOs4SYhtEKjyksMLgQ1rQLtZDrOp4cw4Cg+sE
 0733u7OxrPUHfh8HxaeClvBdvsCX8lwnA2AEBsl47ey9EyLrs3QEky2hOFPr9ZtA63yw
 s21WO94L5gFyUixENl09h7Q/iNhLb6gxmWUCScuF9RLuIU0lyYsTavvYaVObKqs7YUsc
 DsYpKeH665Il7WyQeF+t5UVFptkbLU+Qsr4hFymEtglTpbB5fZoOfA3wuaXsSG7EWZsO
 DQEQ==
X-Gm-Message-State: AOAM531/vNmkm+XZ7woHmY6VYWQLopepq/kRdqHcqDgfvOTD7VqXiW89
 plrLRPm/itTtljzeTID5xJeZVwyy8DxadPQ8ApSyJ0NlCW2p9/o0faPTrL4IEE/Gwe6kY7klHwc
 zSm9oEdmOJrnWC5Y=
X-Received: by 2002:a1c:5fd4:: with SMTP id t203mr9952474wmb.175.1590075593000; 
 Thu, 21 May 2020 08:39:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfVFA16Vk7DH3k5Gli/MWqVyNwVg5WtcQ3TOTHXqa1Cxgchjm6mOUYuBDf5kB3v7fVX8NKYQ==
X-Received: by 2002:a1c:5fd4:: with SMTP id t203mr9952456wmb.175.1590075592732; 
 Thu, 21 May 2020 08:39:52 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.160.154])
 by smtp.gmail.com with ESMTPSA id v19sm6410774wml.43.2020.05.21.08.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 08:39:52 -0700 (PDT)
Subject: Re: [RFC PATCH v2 6/7] accel/kvm: Let KVM_EXIT_MMIO return error
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20200518155308.15851-1-f4bug@amsat.org>
 <20200518155308.15851-7-f4bug@amsat.org>
 <CAFEAcA8tGgyYgHXT5LVGz675JMq6VWR56H++XO5gtTrcaZiDQQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0c0cbdc0-a809-b80b-ade3-9bdc6f95b1a8@redhat.com>
Date: Thu, 21 May 2020 17:39:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8tGgyYgHXT5LVGz675JMq6VWR56H++XO5gtTrcaZiDQQ@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 06:06:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 kvm-devel <kvm@vger.kernel.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/05/20 18:01, Peter Maydell wrote:
> The "right" answer is that the kernel should enhance the KVM_EXIT_MMIO
> API to allow userspace to say "sorry, you got a bus error on that
> memory access the guest just tried" (which the kernel then has to
> turn into an appropriate guest exception, or ignore, depending on
> what the architecture requires.) You don't want to set ret to
> non-zero here, because that will cause us to VM_STOP, and I
> suspect that x86 at least is relying on the implict RAZ/WI
> behaviour it currently gets.

Yes, it is.  It may even be already possible to inject the right
exception (on ARM) through KVM_SET_VCPU_EVENTS or something like that, too.

Paolo


