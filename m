Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00A131964C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 00:06:14 +0100 (CET)
Received: from localhost ([::1]:58386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAL2L-0004J7-U3
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 18:06:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lAKvj-0008K0-H6
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 17:59:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lAKvh-0005Fq-QD
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 17:59:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613084360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9q1aTJNOIHu2S4p9ny/kRe1m3k1B38k39te9MPUMiJ4=;
 b=AjBon+xNCkOd8lUeFLs/9Bmd+lwBERq2PkfI64061qdCuqbeng88HUF5HQGgNXgjg+Kzya
 2xu3aLDIpALv2YvjyJGwInN9RFKrBDqVitmpeBzc+IoY2tumPNB1DsRa1vtOR/cbu2PBk5
 bSUaRFfYgHAsl7TJbb95cATDvTfzCcY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-n7qGnd3tPUOCEBUjlxjPUA-1; Thu, 11 Feb 2021 17:59:19 -0500
X-MC-Unique: n7qGnd3tPUOCEBUjlxjPUA-1
Received: by mail-wm1-f70.google.com with SMTP id t128so2995783wmg.4
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 14:59:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9q1aTJNOIHu2S4p9ny/kRe1m3k1B38k39te9MPUMiJ4=;
 b=gKCH84NxDFIDtF79FfF5c2tFgomUZ+C9izJraCcZnmeje+f4x2WkWB+ew2CJJoEjfm
 +q5eWvsjYEfdHfGMd/0dtkX1JKRX/n1wGAk4CILfYcGW+m9ZQ2XDTCnfXx9f2Nmz76d+
 j2tALMECwZokDCIZiyw3Y7YmClPf57KQ0BEboRnqCjVE1z67iofbHMIRAjPf/nxuPnij
 pang9LsKvqB6TkgPYY8aIniUi3CkdfaZC18nm1C+E7oNj6+y+YBIn0HsbIq+Y7RuGmR4
 c6+sXhj3myq2kS8408j2U7lLm9bizAoIyMnmyfEN1roe/OtS5oCpIIF87HmVj21jXhG3
 4www==
X-Gm-Message-State: AOAM5336HIF5KgFFHIFQu9X83vgtT0oJqyT34ACvahn1XhfGXA8WxTS6
 9PVZRonjMq4LvrMoc0HkGEJ/N6Qo06OXsScD4VuM2KGhtHBvSq6sPt5RP6hNGiS8XGBa93oF0ho
 JBb0X/QrlzMUAODY=
X-Received: by 2002:adf:e585:: with SMTP id l5mr75078wrm.85.1613084358149;
 Thu, 11 Feb 2021 14:59:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwA9g3daY8pnX0MXkF/Qwxn9xEJfkrlObVsde/fAsiCnCL+gcAa/Sd2rOlt7Xtk3ljG+q7IsQ==
X-Received: by 2002:adf:e585:: with SMTP id l5mr75057wrm.85.1613084357857;
 Thu, 11 Feb 2021 14:59:17 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y5sm11107782wmi.10.2021.02.11.14.59.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 14:59:17 -0800 (PST)
Subject: Re: [PATCH v2 3/4] utils: Deprecate hex-with-suffix sizes
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210211204438.1184395-1-eblake@redhat.com>
 <20210211204438.1184395-4-eblake@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <323ae720-d07e-c3a4-0598-e893d5b6d51e@redhat.com>
Date: Thu, 11 Feb 2021 23:59:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210211204438.1184395-4-eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: vsementsov@virtuozzo.com, berrange@redhat.com, qemu-block@nongnu.org,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>, tao3.xu@intel.com,
 rjones@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 9:44 PM, Eric Blake wrote:
> Supporting '0x20M' looks odd, particularly since we have a 'B' suffix
> that is ambiguous for bytes, as well as a less-frequently-used 'E'
> suffix for extremely large exibytes.  In practice, people using hex
> inputs are specifying values in bytes (and would have written
> 0x2000000, or possibly relied on default_suffix in the case of
> qemu_strtosz_MiB), and the use of scaling suffixes makes the most
> sense for inputs in decimal (where the user would write 32M).  But
> rather than outright dropping support for hex-with-suffix, let's
> follow our deprecation policy.  Sadly, since qemu_strtosz() does not
> have an Err** parameter, and plumbing that in would be a much larger
> task, we instead go with just directly emitting the deprecation
> warning to stderr.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  docs/system/deprecated.rst |  8 ++++++++
>  util/cutils.c              | 10 +++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


