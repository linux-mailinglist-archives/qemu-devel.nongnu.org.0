Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4035241D44C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 09:15:21 +0200 (CEST)
Received: from localhost ([::1]:51520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVqHn-0005QC-Td
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 03:15:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mVqDH-0000NP-Ae
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 03:10:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mVqD0-0007G2-Km
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 03:10:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632985816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CpeJKOyXPV/ossVffDS+z/ygYPA18wI+XGV85GMATj8=;
 b=cBn8d+nWF2gStHwTHbkMx3c48m8f29CG+BCKXr92L/xbYmk/hKC8i6wpN85tQMU+FQQg/V
 KUIH+BEZs+OvI+ahf/ntPE29KzRZJioLElyYwlM5NyFXquB+Iex16BpX0AgiByrb3alFWY
 EEirofVtd2EzyYzX0CH0OClgvAsPsHw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-oQGcxc93MpCrtPhyupTHgg-1; Thu, 30 Sep 2021 03:10:15 -0400
X-MC-Unique: oQGcxc93MpCrtPhyupTHgg-1
Received: by mail-wr1-f69.google.com with SMTP id
 c8-20020adfef48000000b00160646ed62cso1315733wrp.18
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 00:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CpeJKOyXPV/ossVffDS+z/ygYPA18wI+XGV85GMATj8=;
 b=acgyCKaZ7nFuCIuCGjpvMBdyC+HlvnjLdIuXJWXWOu39ZZfFb/ENs44YxCsmfA/lfr
 DiUHvRmYb5kkqdbTuuoYNsj8dvTwESZCanV0s0S/1TNiJH4G0+by7Ti3NWLmxskFtBkL
 4HQ5B2WpoUA05okcuaYEtXCXT99Ta3EIadf3RmSF3zgXMXtAFgN/1Kvdn10K0Ng5PZHq
 UEO0ZsnhwDc8zlEVd1jyKlMNTjm1hKrx3YDlFckXMsEPshtNkCBvgHKI2WjlBYcwRfQs
 udoTUhP8Zx47UFdyqhED5pLyR8fNpsO03EAZv8GRUpS59bLNc69pz7bHcgTNboUN1JDw
 eF/Q==
X-Gm-Message-State: AOAM531StDw0ouBNr9IuhDQiztILAnIlg1ob4bg5o2/usEKacnwHSFBr
 9uwC9q/s4S7zy6WFIiAFL9hET++h+3+0+9eSI5jenq0qkk5pFLsKBQ+KThlhS/td120p7YclCKd
 fpzatznI+JttrBpU=
X-Received: by 2002:adf:fd10:: with SMTP id e16mr4301084wrr.377.1632985814304; 
 Thu, 30 Sep 2021 00:10:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2M+HYp/ETcfUMow4mNwTdt4/dAmQOTDyJxeOHFIixvYYe3fY+FeuGzB4tJqhBKIe3SKTlag==
X-Received: by 2002:adf:fd10:: with SMTP id e16mr4301066wrr.377.1632985814107; 
 Thu, 30 Sep 2021 00:10:14 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id e5sm2091434wrd.1.2021.09.30.00.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Sep 2021 00:10:13 -0700 (PDT)
Subject: Re: [PATCH 3/3] dtc: Update to version 1.6.1
From: Thomas Huth <thuth@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>
References: <20210827120901.150276-1-thuth@redhat.com>
 <20210827120901.150276-4-thuth@redhat.com>
Message-ID: <7004c933-5262-3119-80f5-722a8e858046@redhat.com>
Date: Thu, 30 Sep 2021 09:10:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210827120901.150276-4-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.03, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/08/2021 14.09, Thomas Huth wrote:
> The dtc submodule is currently pointing to non-release commit. It's nicer
> if submodules point to release versions instead and since dtc 1.6.1 is
> available now, let's update to that version.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   dtc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/dtc b/dtc
> index 85e5d83984..b6910bec11 160000
> --- a/dtc
> +++ b/dtc
> @@ -1 +1 @@
> -Subproject commit 85e5d839847af54efab170f2b1331b2a6421e647
> +Subproject commit b6910bec11614980a21e46fbccc35934b671bd81

Ping!

David, could you please pick up this patch if you don't mind it?

  Thanks,
   Thomas


