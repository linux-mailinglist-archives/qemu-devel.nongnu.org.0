Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F339B2DF481
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Dec 2020 09:53:58 +0100 (CET)
Received: from localhost ([::1]:34176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kquTV-0006KR-IU
	for lists+qemu-devel@lfdr.de; Sun, 20 Dec 2020 03:53:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kquSb-0005u2-68
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 03:53:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kquSX-0004X6-K5
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 03:53:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608454375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b/oG4S2SsczwGeZOV6JHTDOzpnrhhUULeivr91cWSJc=;
 b=cBz6CnL05PKtWQHCQjIxrrPoX9fDPVJsFYANLW0bpOJOK2NiVdV3Co5za0R1Q7/B5JDm6p
 eEgTDq5B3uOgpR6Ylj+HshP8xo4loboIeW1jAiTxEY/UFPDwUCCrLxsvbSg5iRjBfae29n
 oATbgN2Rn5cjWu05UVdo6MgjQbVFaRQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-LT07eE6xOgyrb4L3ytR63w-1; Sun, 20 Dec 2020 03:52:51 -0500
X-MC-Unique: LT07eE6xOgyrb4L3ytR63w-1
Received: by mail-ej1-f71.google.com with SMTP id lw15so2582953ejb.7
 for <qemu-devel@nongnu.org>; Sun, 20 Dec 2020 00:52:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b/oG4S2SsczwGeZOV6JHTDOzpnrhhUULeivr91cWSJc=;
 b=eMkl5o/PNKXcncAYoxrnh3PTdL2QrRH4pFI0lbnxBaG00+ZaNPp5sw9bO+veTEF1Z5
 8djUgtVUb94bz3t+SjvISOsFM5viTu6mZNWKJS+Rh1OS7hwbFaxmdu8eXhCpLAru+kz5
 g85poLF7EKJZIH0cl1bTg6DpGnrSLA5Edboguf3bjItpYaFHBcAmggsE9WbF8Ebznhl8
 II6VCovc7MpJEuzopK1up17/4vSIzUZ9RIXBcUWGm2VN+2vHmw/xQ0I0D6wyw/eiOshi
 YlU7BqdE0FYXWWtBi9cd/WLEBLmRM+cxQNzHXMIUZO4LWHjdN2gBCniyE9Dc4N+0xErm
 JrLA==
X-Gm-Message-State: AOAM532S1bGHYzS260BxzTRfthgYMmzpxp0W4e+3fyemb4gEwpL5GkrK
 kFXruA48P8sHgkHaiJvFMZ1LbZxRHRRX2ZkUVWuSl4XCM2U7IG+UPcOPpij3prxUErNN22urwlr
 gBhS4OtBICIs6hjo=
X-Received: by 2002:a50:8a90:: with SMTP id j16mr11437853edj.334.1608454370498; 
 Sun, 20 Dec 2020 00:52:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGaqC4HBIKRcpPJ5dWNVQ7S6WDHJkBYy6sodziMV9Rc7L+r+a9CqyVnhLJoc9bvkNqqsUXTQ==
X-Received: by 2002:a50:8a90:: with SMTP id j16mr11437846edj.334.1608454370336; 
 Sun, 20 Dec 2020 00:52:50 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id u26sm26861381edo.37.2020.12.20.00.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Dec 2020 00:52:49 -0800 (PST)
Subject: Re: [PULL 02/45] vl: remove separate preconfig main_loop
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20201215175445.1272776-1-pbonzini@redhat.com>
 <20201215175445.1272776-3-pbonzini@redhat.com>
 <e28196a5-2221-fcd6-c497-f7c595e2c3e0@vivier.eu>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a95a64df-5fac-0705-fcc0-d0a98bf0ad80@redhat.com>
Date: Sun, 20 Dec 2020 09:52:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <e28196a5-2221-fcd6-c497-f7c595e2c3e0@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/12/20 22:30, Laurent Vivier wrote:
> Then:
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 0ed5c5ba9348..2f198e0023e0 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2525,6 +2525,7 @@ void qmp_x_exit_preconfig(Error **errp)
> 
>       qemu_init_board();
>       qemu_create_cli_devices();
> +    qemu_init_displays();
>       qemu_machine_creation_done();
> 
>       if (loadvm) {
> @@ -3529,7 +3530,6 @@ void qemu_init(int argc, char **argv, char **envp)
>           exit(0);
>       }
> 
> -    qemu_init_displays();
>       if (!preconfig_requested) {
>           qmp_x_exit_preconfig(&error_fatal);
>       }
> 
> and then re-try:
> 
> qemu-system-x86_64 -device virtio-gpu-pci
> 
> -> we have the BIOS boot screen.
> 
> Any idea?

Yes, I have sent a patch already but not a pull request.  I was waiting 
for Alex's own PR to be applied, but it had some issues.

Paolo


