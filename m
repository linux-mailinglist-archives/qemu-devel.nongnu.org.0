Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FA0337007
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:30:50 +0100 (CET)
Received: from localhost ([::1]:54958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKIaf-0006yb-3M
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:30:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKIZD-000689-B6
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:29:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKIZB-0003Ap-Ev
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:29:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615458556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/AucjCVPJRhJtwEM+L+kVL/TiJj8L13353uoZpbIOVI=;
 b=CmwWuafFer3bIKVnUZhztw+C8GDJNU2oODJgseL20j1X8YNPeBO9xj7WCTs5i3O/kuukEU
 WsySxEcq25Vd+YQ9X5XFsEzbGMH9tAN/3kZvQCoxwstxa6hNpkcbq9BvfRpAtejcfpK8Mh
 EwIc+VVgwbUqB6eGO/6IOnZaNzL9dYg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-RAwCX3IiNCSHNiDZksmQmg-1; Thu, 11 Mar 2021 05:29:14 -0500
X-MC-Unique: RAwCX3IiNCSHNiDZksmQmg-1
Received: by mail-ed1-f72.google.com with SMTP id u1so9677726edt.4
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 02:29:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/AucjCVPJRhJtwEM+L+kVL/TiJj8L13353uoZpbIOVI=;
 b=InBFo6amfryB6YDvw1QN9TCxAJjDqmz4y9NhBPCQQ3MYxUqTCzDEG2BcjeD4GI2RtE
 Cj2xUkEl02Bv98o07ITuPVDyu9qUYJYiOtnh+XBoikHkPTVHBAJb1gfWcCms1J80c9+q
 p1qgviTDPu/jllY+bYNHVWUNBhmkUpEQpTxEXk+PZCjrHPh/ZT843fdcPPMhdSyHw1op
 ZTn/f+MY55XlMvRSFwHD9sJqNCSLqnaphnuKlVYorReOmdtX1LhCbsHGK3R6PJWqe5ED
 BdUM64Tul8uIZHWIE7HTGypOy01ww1w2hkCFOMfjbqan/i1ugi3KSfoHYiFSNqb7ynh7
 y2iA==
X-Gm-Message-State: AOAM531C4DSjAm8K09YP24ImVbfs0t/eMLAcPDsni5lRCIyjA+EKWJcv
 rzm8/1zFZAgRDgm5x4hPf30ZggCZoEpC/rDyqa/4ZAaJx1/yJUp0MkHgPrizJ4FODyPa22LEmAA
 NcdAPFxO8Poo6+tw=
X-Received: by 2002:a17:906:ca50:: with SMTP id
 jx16mr2434934ejb.72.1615458553262; 
 Thu, 11 Mar 2021 02:29:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsoU1kZ8EULR836gC1MjuZ2v2Sk+qsWGQBFwd0ZOiHYYFKrNjhAWW8mIY1NYVxYipnSRIHGg==
X-Received: by 2002:a17:906:ca50:: with SMTP id
 jx16mr2434919ejb.72.1615458553048; 
 Thu, 11 Mar 2021 02:29:13 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm1001771edm.89.2021.03.11.02.29.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 02:29:12 -0800 (PST)
To: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20210310173323.1422754-1-thuth@redhat.com>
 <20210310173323.1422754-4-thuth@redhat.com>
 <87y2euqe4j.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 3/4] usb: Un-deprecate -usbdevice (except for -usbdevice
 audio which gets removed)
Message-ID: <11dbbbed-36c2-c312-7577-c2843b4e368a@redhat.com>
Date: Thu, 11 Mar 2021 11:29:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87y2euqe4j.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/03/21 09:38, Markus Armbruster wrote:
> 
> If we decide we want something else, keep -usbdevice braille deprecated
> until something else is ready, then keep it deprecated for a sensible
> grace period, then remove it.  Flip-flopping deprecation in between is
> not helpful.
> 
> If we can't make up our minds, keep it deprecated until we do.
> 
> Only if we decide the sugar should remain -usbdevice braille, we should
> undeprecate it now.
> 
> The road to the CLI hell we're in is paved with "convenience".

A lot of the work I did in 6.0 on vl.c and friends was exactly to figure 
out:

- which of our CLI interfaces are a maintainability issue and really 
need deprecation

- which of our CLI interfaces can be modified to improve maintainability 
and simplify the addition of new interfaces

- how machine creation *really* works, so that it's easy to add things 
at the right spot.

Of course _everything_ is a maintenance cost, but you can at least make 
sure that the cost is not visible to most developers.  This series, as 
well as the previous removal of parameterized -usbdevice is just doing 
that: keep the decent parts that do not hamper maintainability, 
deprecate/remove the rest.

Paolo


