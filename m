Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911FD26AA1E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 18:55:15 +0200 (CEST)
Received: from localhost ([::1]:52790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIEEc-00045a-F7
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 12:55:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kIE7j-0004cw-DX
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 12:48:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kIE7g-0008BP-El
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 12:48:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600188483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lgItECeWvYTLmu2m7VBqMl/s+QqqN6gyY30+B6iwNZo=;
 b=bFONzF8HJNTVYOKusPWe60hqtlBsto8E43LcTB6bf7cTqTO8Es6bH92wdIMTdAU+qq+1tK
 2x5szFN52iGB5lwl+3VO4GCJ5p61q6d5G8NeeoeXlytlDT890zsWJi6z0mVK40XcMVuUJy
 2H0p29i0s7Mt74ZkW44TzRNi+15qwws=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487--MAK_58TOMelOKgPcagrpQ-1; Tue, 15 Sep 2020 12:47:59 -0400
X-MC-Unique: -MAK_58TOMelOKgPcagrpQ-1
Received: by mail-wr1-f72.google.com with SMTP id v12so1448966wrm.9
 for <qemu-devel@nongnu.org>; Tue, 15 Sep 2020 09:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lgItECeWvYTLmu2m7VBqMl/s+QqqN6gyY30+B6iwNZo=;
 b=pOmk+T8YLHujJRQ/hiKpVr3v/TO12DMLzcXVeRx4rOdzH6TraR+UTsEq98Njoazh63
 TpdtduVvEucIUuRMSbcpTJ3e6GrL8FIHc/eR8NW4Jtc4KYhxhttituTTsKM480S50edH
 e4lfo5pNY9TESvITlHae8G1LOSL37qx0j+cjn2SWIDaJeHkPKCpLYorRH97uEa944H5U
 SvkVqvWI+xoe6tBdqK8l8F7CVz3A3ZwaXPgcXkJAW3TAyVRLTFDVYV48C1bmDWKZOEWQ
 fljen8WMonZqCzCbyUXFLaemP9JLM6aKBg+kJhQBRn/A8PintWxQXreByx2LGyAAC64X
 kqSA==
X-Gm-Message-State: AOAM532J5AveS8vqmuoweqIXgbStj+MTTni+C17zRnbKuF6RNxQfjwjW
 50lIavd6pyoV9l48l03hnYfv9/HCmAqlL/5paCA68h8F8K93qxEEqzSuGvF7G237ZCKEo90S/CT
 wv6BIa2JbFjlT2Dk=
X-Received: by 2002:a5d:40c4:: with SMTP id b4mr19325022wrq.151.1600188477677; 
 Tue, 15 Sep 2020 09:47:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdo8GI8YstFgBIS3IZYLwYcdlpZRihPE6fTqu5OTA20VBH9ZlSrfK16u1IdDVZYbccv5ztbw==
X-Received: by 2002:a5d:40c4:: with SMTP id b4mr19325007wrq.151.1600188477451; 
 Tue, 15 Sep 2020 09:47:57 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:eac8:587f:8ca7:e1e8?
 ([2001:b07:6468:f312:eac8:587f:8ca7:e1e8])
 by smtp.gmail.com with ESMTPSA id v17sm27639581wrr.60.2020.09.15.09.47.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2020 09:47:56 -0700 (PDT)
Subject: Re: couple meson issues
To: Andrew Jones <drjones@redhat.com>
References: <20200915134412.5jmvbs7eqcv5sugc@kamzik.brq.redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <472c32dd-b6b2-2c71-9366-f92c3af5eba4@redhat.com>
Date: Tue, 15 Sep 2020 18:47:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200915134412.5jmvbs7eqcv5sugc@kamzik.brq.redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 02:10:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/09/20 15:44, Andrew Jones wrote:
> Hi Paolo,
> 
> I noticed that 'make check-qtest-aarch64' no longer runs the
> arm-cpu-feature test. I simply did
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 874b5be62be2..db169a53b530 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -146,7 +146,8 @@ qtests_aarch64 = \
>    (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \
>    (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
>    (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
> -  ['numa-test',
> +  ['arm-cpu-features',
> +   'numa-test',
>     'boot-serial-test',
>     'migration-test']

Yes, either that or "qtests_aarch64 = qtests_arm + <whatever is there now>".

> to get it to run, but don't know if it should be done that way. Were you
> planning to inherit tests for aarch64 from arm or something instead?
> 
> Also, I was surprised to not see something like "KVM supported" when I did
> configure on an AArch64 machine with KVM.

That's a "TODO":

# TODO: add back KVM/HAX/HVF/WHPX/TCG
#summary_info += {'KVM support':       have_kvm}
#summary_info += {'HAX support':       have_hax}
#summary_info += {'HVF support':       have_hvf}
#summary_info += {'WHPX support':      have_whpx}
#summary_info += {'TCG support':       have_tcg}

which I had honestly completely forgotten about.

Accelerator support is per-target so it must be computed in the "foreach
target : target_dirs" loop around line 550 of meson.build.  But I might
even have the patch already, since it was meant to be temporary and
fixed as soon as that loop was added to meson in the very first series.

Paolo


