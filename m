Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4714B3C1A79
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 22:19:06 +0200 (CEST)
Received: from localhost ([::1]:54616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1aUD-0005ak-9f
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 16:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1m1ZlT-0006jM-Tu
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:32:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1m1ZlR-0003Rv-S4
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:32:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625772768;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tJJW5bF5lmYhlIBUcEUbAHGOtDwJ+DYVe8mfz65dW3c=;
 b=Radt2WI2byfukjkeq7Npul8scHml+XtB4PxFzhmZCZgWh0xhMUpzljXU2gIhWWk55xyZQ5
 LcDlqVMAA8dIuOSF9evD9TNh2x4OGTLGiFgyrC+6l3OKdk7+/qhHVgcrHS1cBDA+24zMxt
 mPCgfb0eA/2EEcdfh9OU+CgCjwgFZ7Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-7qMADtF4O7GdqKTRcIesTA-1; Thu, 08 Jul 2021 15:32:47 -0400
X-MC-Unique: 7qMADtF4O7GdqKTRcIesTA-1
Received: by mail-wm1-f69.google.com with SMTP id
 h4-20020a05600c3504b02902190c4d3d18so1079070wmq.8
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=tJJW5bF5lmYhlIBUcEUbAHGOtDwJ+DYVe8mfz65dW3c=;
 b=OQIxgFrfaM5v1y2ygY/H6R1l2vXqqSRWp1UQnjgmM1eXcwJ/tN7Cb2auS77nsLnYp9
 tUCEwFMTCuJrF+PLC7bBuztbTbFRWZgv7bKnxMn8PuljExILCNYFzNgpBPH4L5FWfR8b
 QyfGQdraXYjpN2ZN1YBc194bIVqcg6URYoguHONfWl1PnGGYaSzQVTws/2v0LFIiBnJS
 pl7cRu/7z1Z7ltAU0faM5ODZtYx2V6DTt1b8qTcKd1kwmNn5EeMYuGTGv1lXE+LZSDLg
 n/kWqoM/spSE/5KgFUxeAvYgcYcbeSrFfp2vvYxB8maNHNrPRbG8yvw9VxEfeJPB8/Mg
 uboA==
X-Gm-Message-State: AOAM532hRQMNriE3zmQmHxUqCZJfFPmK8ajsmenC5hsSeTdaDhW48wDy
 WrwQeDoKRrPmD0Ty5WVhW8sUHNjYEuYMmQjlOG4T0zRuegb3U1z1jZVRbISjvu0p9VFmvnhQKtD
 f6aLF7uK/ROoEvig=
X-Received: by 2002:a1c:7717:: with SMTP id t23mr7129205wmi.3.1625772763292;
 Thu, 08 Jul 2021 12:32:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzA71oIts/miaV7vCRS1uC9z3BYVMjLE6KwCsoitjisHo9Y/Z3kzw+GE6mtWKIV6BV1jaKRMg==
X-Received: by 2002:a1c:7717:: with SMTP id t23mr7129185wmi.3.1625772763123;
 Thu, 08 Jul 2021 12:32:43 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id l17sm9900940wmq.3.2021.07.08.12.32.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 12:32:42 -0700 (PDT)
Subject: Re: [PATCH v5 1/4] avocado_qemu: Fix KNOWN_DISTROS map into the
 LinuxDistro class
To: Cleber Rosa <crosa@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, philmd@redhat.com, wainersm@redhat.com
References: <20210706131729.30749-1-eric.auger@redhat.com>
 <20210706131729.30749-2-eric.auger@redhat.com>
 <df9835de-fe4a-2233-a625-3b04b7b0d514@redhat.com>
 <917bb587-ccd1-cac7-1e82-d2f869feaf02@redhat.com>
 <7e1cf0c6-97b4-ebfe-f046-c2fe06e5e6e3@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <1cd52b26-aec2-6173-4340-8df87aa79c65@redhat.com>
Date: Thu, 8 Jul 2021 21:32:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <7e1cf0c6-97b4-ebfe-f046-c2fe06e5e6e3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Reply-To: eric.auger@redhat.com
Cc: wrampazz@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cleber,

On 7/8/21 7:34 PM, Cleber Rosa wrote:
>
> On 7/8/21 4:56 AM, Eric Auger wrote:
>>
>> I am not sufficiently expert on the test infra and python to be really
>> efficient fixing that. Can anyone help quickly to target the soft
>> freeze? Otherwise, today I will drop that patch and restore the code I
>> had in v4, just based on Cleber series. I think the refactoring can
>> happen later...
>
>
> Hi Eric,
>
>
> The following diff works for me:
>
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py
> b/tests/acceptance/avocado_qemu/__init__.py
> index af93cd63ea..b3bed00062 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -310,6 +310,8 @@ class LinuxDistro:
>              '31': {
>                  'x86_64':
>                  {'checksum':
> 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'},
> +                'aarch64':
> +                {'checksum':
> '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49'},
>                  'ppc64':
>                  {'checksum':
> '7c3528b85a3df4b2306e892199a9e1e43f991c506f2cc390dc4efa2026ad2f58'},
>                  's390x':
> @@ -323,10 +325,11 @@ def __init__(self, name, version, arch):
>          self.version = version
>          self.arch = arch
>          try:
> -            self._info =
> self.KNOWN_DISTROS.get(name).get(version).get(arch)
> +            info = self.KNOWN_DISTROS.get(name).get(version).get(arch)
>          except AttributeError:
>              # Unknown distro
> -            self._info = {}
> +            info = None
> +        self._info = info or {}
>
>      @property
>      def checksum(self):
>
>
> I've tested it with both existing and the newly introduced tests.

Thank you for the work! Do you plan to introduce it as a fixup or do I
need to respin?

Thanks

Eric
>
>
> Cheers,
>
> - Cleber.
>


