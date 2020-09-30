Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C912F27E949
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 15:16:45 +0200 (CEST)
Received: from localhost ([::1]:34490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNbyO-0001dK-UP
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 09:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kNbx6-0000fv-27
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 09:15:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kNbx4-0003GC-B7
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 09:15:23 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601471721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pE7pLnAtKLvtKGLxk3roLGYbmi1KJ4ewWIZvvjqE4tc=;
 b=H3FJvG3FufTJhzz4l2Y/r8oBL2hvn4CC10sWFtOySM2E5Quq23mpGIou1wCj+ICL0gx3cV
 VzvZx5p4yC4O1jERhNMk1j26J1dWLuEiRHMguelXPvrrMxqEyv1jkeZEW3xbBsprgpun+2
 SLYafPnZvmOo0aBdNP5D8+LHEuEKOU0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398--eAuUtGSObajpkuTCUE_Ng-1; Wed, 30 Sep 2020 09:15:17 -0400
X-MC-Unique: -eAuUtGSObajpkuTCUE_Ng-1
Received: by mail-wm1-f70.google.com with SMTP id p20so465652wmg.0
 for <qemu-devel@nongnu.org>; Wed, 30 Sep 2020 06:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pE7pLnAtKLvtKGLxk3roLGYbmi1KJ4ewWIZvvjqE4tc=;
 b=fMTJK3/Jf6jBmhyrkNpk3P0KZ14vFL29hQ/k+kipx5Xwa5S4HlWvBUnkhht0N5235a
 u8XjvIT98iFoOj3NVxfUlJzZQ+lE5N+8yhfgwm/XpqNxskQVmmzztLj6RZM1MofcYpnf
 oGxRdEus49L/5zVuUaPTCPyaijb1OwYvPVowITRKsj7WRC0u630PqMRtcm4Te1hSgfW7
 8mxBW34eyACNtcCaqcajgcFoh5LXxC4tUZX1yGZkGNOJNIzJEPdiQeoAawjXfycYi3Bv
 Us51XZQS9SO59QByfQJxCpn/NDYN/czutWpVKVsnW7H0Bra3zDleGVrmiSQR0BX1Lu7F
 r9Sg==
X-Gm-Message-State: AOAM532ZX8JFQPgbQdMsBOS2vcmEEVgx4lvM5ZiK5uCU5R4maYCxJs/i
 LsIPVCmBPmu/7bPouj8IPkKW82+KjkJ0beVyfZBZsILb/qlXeZ7Eza+XxsYLClilCb3n5n+NDja
 Tq7+LTshRRCwU07A=
X-Received: by 2002:a5d:4a49:: with SMTP id v9mr3403979wrs.153.1601471716313; 
 Wed, 30 Sep 2020 06:15:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/BcXKXufbGF65mALVhsHhKkCQaUNUUrrc7V/GxTjYivBuTUzub5UjwOslogL7FTOQejRa3w==
X-Received: by 2002:a5d:4a49:: with SMTP id v9mr3403956wrs.153.1601471716092; 
 Wed, 30 Sep 2020 06:15:16 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:75e3:aaa7:77d6:f4e4?
 ([2001:b07:6468:f312:75e3:aaa7:77d6:f4e4])
 by smtp.gmail.com with ESMTPSA id v2sm2959316wme.19.2020.09.30.06.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2020 06:15:15 -0700 (PDT)
Subject: Re: [PATCH v1 03/15] meson: move libmpathpersist test
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20200925154027.12672-1-alex.bennee@linaro.org>
 <20200925154027.12672-4-alex.bennee@linaro.org>
 <f5fc27fa-0c02-b1a9-7f29-dd48aa40fd6a@redhat.com> <87ft70pgpq.fsf@linaro.org>
 <0e0ebdd5-d9b9-17dd-82c9-2c63a73f4eea@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b34a2595-f68d-8aa9-cf32-72e9f4abd1a2@redhat.com>
Date: Wed, 30 Sep 2020 15:15:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <0e0ebdd5-d9b9-17dd-82c9-2c63a73f4eea@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:31:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/09/20 12:54, Thomas Huth wrote:
> On 30/09/2020 12.51, Alex Bennée wrote:
>>
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>
>>> On 25/09/20 17:40, Alex Bennée wrote:
>>>> From: Paolo Bonzini <pbonzini@redhat.com>
>>>>
>>>> This is the first compiler/linker test that has been moved to Meson.
>>>> Add more section headings to keep things clearer.
>>>>
>>>> [thuth: Add check for mpathpersist.found() before showing mpathpersist_new_api]
>>>>
>>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> Message-Id: <20200918103430.297167-3-thuth@redhat.com>
>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> <snip>
>>>
>>> This is not the latest version of the series, can you drop patches 2
>>> and 3?
>>
>> Hmm so now I'm seeing failures in the bionic builds thanks to libmpath:
> 
> Paolo's PR with the fix is still not merged yet (see "[PULL v7 00/87]
> Misc patches for 2020-09-24") ... but maybe you could pick the newer
> version of the libmpath patches from his PR into your queue?

Unfortunately that part is what's still broken.  I'll send again the
pull request today, hopefully eighth time is the charm.

Paolo


