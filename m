Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B5B3D212E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 11:48:45 +0200 (CEST)
Received: from localhost ([::1]:50494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6VJs-00068O-8W
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 05:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6VJ0-0005PC-PW
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 05:47:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6VIx-0004EQ-2h
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 05:47:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626947265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=twGB752p0ZhfEdSJWvz2K3ApmGi+6V2qleSu7Ed3xmA=;
 b=Mw00BHFpOe0x/3wQM3pbamu4sKFcx4nIODTp9sTamqheTOeBkGd00+InlfcJcIXpQ0qe4F
 D+Niqn/aBVxybrM9JkDx2o0omxvq/jI3Xb0LbMMcq511W20NmFz8JDBPnwHA/Lwum+kWGz
 Ot5gkjX07hIeS8/rYpVXPMfM/28AK9E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-zNz6OD33NlaZ1-Ifr_5jMQ-1; Thu, 22 Jul 2021 05:47:43 -0400
X-MC-Unique: zNz6OD33NlaZ1-Ifr_5jMQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 v25-20020a1cf7190000b0290197a4be97b7so1312477wmh.9
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 02:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=twGB752p0ZhfEdSJWvz2K3ApmGi+6V2qleSu7Ed3xmA=;
 b=lexotvp74fBhhTkE9G7nq3dYz2dM6S2tYzehGepwsJ3Oridk7H23AB09ozpn5Cbodq
 qIM/CfPFqpg6QbgbdKNcMj9kqsJJqn9VpZraeMShIXLClWolDo7TiRo4h7CL17DX3NpB
 QalrJqNU74CzEqZcHa28AnOeYtzO6bXGpHYVqSks4OraI6ki/Pr5plkC4znol/dkbV/G
 QAMms55xFBj3bkNpgaATaxp5ixyJwpRxy7kBH2rb7/Zi1m3rQx2O+dRC94n6+hDXsRXi
 fIbHa7oBfvt2+2bqg3g1tDmJFCLSr95WmFz5l5fhw8Exhj8Sy53Cf7+bZ8onUM5h0QN1
 ChWw==
X-Gm-Message-State: AOAM532J5oakBiikzELyHNBWXGvgmjVB/9wxA+8N/pSsgmHdCNGefGVB
 dwUbj3HCBtWETf8AUX16BO6YOJMn9aYbJG+dl3Oazwt0QdmaKtFDy5kkzvjgg2GrW4ZmcMygm2J
 eihT7F0xlmM9x1Ac=
X-Received: by 2002:a1c:6a06:: with SMTP id f6mr6239299wmc.38.1626947262568;
 Thu, 22 Jul 2021 02:47:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnxceeRARwq4Hdn824Z2Shd9Akq4m3CRl9ae5i2ZnvyhEHK3RTiHtNBXJJt4PL+ZnSb9Vz0w==
X-Received: by 2002:a1c:6a06:: with SMTP id f6mr6239277wmc.38.1626947262318;
 Thu, 22 Jul 2021 02:47:42 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6970.dip0.t-ipconnect.de. [91.12.105.112])
 by smtp.gmail.com with ESMTPSA id f7sm2133585wml.35.2021.07.22.02.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 02:47:41 -0700 (PDT)
Subject: Re: [PATCH v3] migration: clear the memory region dirty bitmap when
 skipping free pages
To: Wei Wang <wei.w.wang@intel.com>, qemu-devel@nongnu.org
References: <20210722083055.23352-1-wei.w.wang@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <0faf5f01-399f-621f-431e-d35b3e87b9ff@redhat.com>
Date: Thu, 22 Jul 2021 11:47:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210722083055.23352-1-wei.w.wang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: mst@redhat.com, dgilbert@redhat.com, peterx@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.07.21 10:30, Wei Wang wrote:
> When skipping free pages to send, their corresponding dirty bits in the
> memory region dirty bitmap need to be cleared. Otherwise the skipped
> pages will be sent in the next round after the migration thread syncs
> dirty bits from the memory region dirty bitmap.
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Reported-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Wei Wang <wei.w.wang@intel.com>
> ---
>   migration/ram.c | 74 +++++++++++++++++++++++++++++++++++++------------
>   1 file changed, 56 insertions(+), 18 deletions(-)
> 

LGTM, thanks

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


