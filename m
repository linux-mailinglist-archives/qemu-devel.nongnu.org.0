Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C732D9754
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 12:24:18 +0100 (CET)
Received: from localhost ([::1]:37554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kolxh-0001I7-D7
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 06:24:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kolwH-0000Ph-2H
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:22:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kolwE-0000ZC-CG
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:22:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607944965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N8Z8Eb0zhKYlgCyyVk8MjeWxBIotXhIVQ+3PdrADHu8=;
 b=BNo1Njx/4CLF5o8cqmMxaNUPToymUumEctc6qhx4PT7SRXJRMFStahzBVNAtV+86TebJxt
 qIP5Fy1EBEisEValxSMq5OrLlClWAXBd8nU6RA3aYv5nJbjhxw/Zo3F9U7yw5+4ixoUPzl
 MfcaJOPLgvBSHQe04enEtOBLlDQOHVE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-9VASUW2uMZS4hlw3bFuHjA-1; Mon, 14 Dec 2020 06:22:44 -0500
X-MC-Unique: 9VASUW2uMZS4hlw3bFuHjA-1
Received: by mail-wm1-f72.google.com with SMTP id l5so3314136wmi.4
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 03:22:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N8Z8Eb0zhKYlgCyyVk8MjeWxBIotXhIVQ+3PdrADHu8=;
 b=jxks1K3cvlFVi0+ijqF6bjRbWANBdQg9DDcT3HBlfjbza23PrMlAb43OScnIHeAqtq
 Qaug5+5QjN7iPq1Qk2j/JktzAIfC4iLEGnaWZnUuED95chUsfDqB2RAJ6IKZI5u7Fn8O
 VmNkjOY3gWhZj9uPNb9V9GHAA0drKD1/ebUH3eitYYRnTxBdTe1pGDXqcEr7JKnJ773u
 KJlrLao341bHfmwn21gZPJM5M3GPaA8H0LQ0qZplc5gGCIVmoVhWPS9gRJPMEGsyqthu
 jh8jm6QcE/WPoVQ2POWjHmbzJ2wZZH01L8ZnqqeGa06VoajX3r5ceLGT0ow+5VcZosrH
 82tQ==
X-Gm-Message-State: AOAM532+y+LGjHP2Agg4EnurKSYKqO/0nPPdHH78T9YIO+LfDkTU8kDe
 iK0FBxmJp9IWHOHy6MOiEk3GG2Z7gLcuaOJ1W4ClaZxStp7HuKMCMCENR8uMU70wteRUns8EJA5
 q8Z2ViMC1P+82F42gyAEvuwc5BNGAFcsQO8ShfaPpnWamAXNsFcRWep5u136kLKjqwe8=
X-Received: by 2002:a1c:f002:: with SMTP id a2mr27154711wmb.101.1607944962380; 
 Mon, 14 Dec 2020 03:22:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzec/ul7jkqCc4G5iaAELbaxQ1mqgC/BQZeK6EKk/gnA3hPbhPiyYRJZ0GCe1OwNHNLg5dspw==
X-Received: by 2002:a1c:f002:: with SMTP id a2mr27154694wmb.101.1607944962151; 
 Mon, 14 Dec 2020 03:22:42 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id u3sm33336665wre.54.2020.12.14.03.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 03:22:41 -0800 (PST)
Subject: Re: [PATCH v4 4/5] configure,meson: support Control-Flow Integrity
To: Alexander Bulekov <alxndr@bu.edu>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>
References: <20201204230615.2392-1-dbuono@linux.vnet.ibm.com>
 <20201204230615.2392-5-dbuono@linux.vnet.ibm.com>
 <20201213025523.lt5sj3k5nui2ntld@mozz.bu.edu>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9326ee06-86f6-d8b8-83d1-d5bd92684941@redhat.com>
Date: Mon, 14 Dec 2020 12:22:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201213025523.lt5sj3k5nui2ntld@mozz.bu.edu>
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
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

On 13/12/20 03:55, Alexander Bulekov wrote:
> Hi Daniele,
> I think it would be nice to have a separate block for get_option('d_lto').
> Unless I missed something, right now --enable-lto --disable-cfi builds
> don't actually use lto.

Meson handles b_lto internally, it should work.

Paolo


