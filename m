Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A3B3313B7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 17:47:18 +0100 (CET)
Received: from localhost ([::1]:37266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJ2L-0004c6-OX
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 11:47:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lJIzE-0002x9-1k
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:44:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lJIzA-0003JV-Hf
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:44:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615221839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6AKkhRkNVpktmEJrFNlPGPFMIs6hLo5wlcB/Ch8Vb2k=;
 b=M9mltz/p0HbjyUrRzF1G5y8lEtaMIzBvGW4RKnrsJxIDRwUsMIZBH3sYb2VRN7+vKKrM10
 cQbsCLXpKRqX3d9gDF4cZ+//TYNg1dsyF1tKxzLsd2Rcnjp35djDqfcmZw/tJwpj0CGIP1
 4+9U8ruUn36hf11vXqyLAD29U4mTH6E=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-C-gP55DQPmOVLKuS6p2_jA-1; Mon, 08 Mar 2021 11:43:57 -0500
X-MC-Unique: C-gP55DQPmOVLKuS6p2_jA-1
Received: by mail-ot1-f70.google.com with SMTP id a20so7481790otd.21
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 08:43:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6AKkhRkNVpktmEJrFNlPGPFMIs6hLo5wlcB/Ch8Vb2k=;
 b=NbWRbHo0YvWZtphF0SIb3XQZtc011c0Z/JXWG8rfpqT4zjbs2RXaH/2YnD7V8nupzh
 K1Q8z3Y9beVfYKfwPAIBHuS8NpE2+qoJM3hdvQ2C8V45nx760pe/KO/bByPadxC3Zl8o
 EKoFBSWEsCnty6ZjDfRhAn2djfA8CStCzVZ0hrcg6YkHPr+TY5wtj+gBzuGd/QxkZxCV
 OLtfI2wwnbx0IAbF78BB1DgLzgo/dTMwlxe5bFZy2whWI8yAWgbvUYnHbkH47967XoUf
 2BszZxZPWliTnT8fOoAFvOSrS96mW4ZW46wodUpm4WdIYQ7NNcMoE+PW8Phpbi8s2pcp
 siKQ==
X-Gm-Message-State: AOAM532xOIsr6/XFQeO2yZO4vJczWbXcoLDtSNFD2FNqpKuzhjnn+lxN
 VNgIWt8mc5wwGBe4XQ11UoD+v0KfDi7/JHchGNv9IGPcLDi4shBkNcET/WxwCddmFfgdk7afkBG
 lFYwuSbMsTd1Uz8E=
X-Received: by 2002:aca:5d56:: with SMTP id r83mr11544502oib.25.1615221835990; 
 Mon, 08 Mar 2021 08:43:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRayYZ9G1ll+NW/mRxxmkBPAFaPOrWDJE7q8+kPOn0ZZMQMCTeVuyCyZsfmzZoGC+CLzbXYA==
X-Received: by 2002:aca:5d56:: with SMTP id r83mr11544493oib.25.1615221835817; 
 Mon, 08 Mar 2021 08:43:55 -0800 (PST)
Received: from [192.168.0.112] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 53sm702071oti.77.2021.03.08.08.43.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 08:43:55 -0800 (PST)
Subject: Re: [PATCH] Document qemu-img options data_file and data_file_raw
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-devel@nongnu.org
References: <20210301172837.20146-1-ckuehl@redhat.com>
Message-ID: <7e18947e-55bd-7f22-a28b-cd226f6bfc3b@redhat.com>
Date: Mon, 8 Mar 2021 10:43:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210301172837.20146-1-ckuehl@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: jsnow@redhat.com, hhan@redhat.com, stefanha@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 11:28 AM, Connor Kuehl wrote:
> The contents of this patch were initially developed and posted by Han
> Han[1], however, it appears the original patch was not applied. Since
> then, the relevant documentation has been moved and adapted to a new
> format.
> 
> I've taken most of the original wording and tweaked it according to
> some of the feedback from the original patch submission. I've also
> adapted it to restructured text, which is the format the documentation
> currently uses.
> 
> [1] https://lists.nongnu.org/archive/html/qemu-block/2019-10/msg01253.html
> 
> Reported-by: Han Han <hhan@redhat.com>
> Co-developed-by: Han Han <hhan@redhat.com>
> Fixes: https://bugzilla.redhat.com/1763105
> Signed-off-by: Connor Kuehl <ckuehl@redhat.com>

I am not sure whose tree this is best suited for; 
./scripts/get_maintainers.pl only showed other contributors to this file 
and not an explicit maintainer, per se.

Connor


