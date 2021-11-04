Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8F8445BFF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 23:06:31 +0100 (CET)
Received: from localhost ([::1]:45256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miksQ-0005wt-BI
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 18:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mikrN-0004zC-Hu
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 18:05:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mikrK-0001ud-Jh
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 18:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636063520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=55IgmPgmgSuFU9TD9sDvt/2ASWtxXb/fPvF+Rr/pBEI=;
 b=OeRsT9OZj037HOboHxS3iv080deug4S+vX9wINGdKbuLky9iA/OesbKr9mQqXoWCXvJ+rO
 QL1KMGx/fpY8TV+yRYj9kXe7+6bC9Qhn3AYnCyYIPUOf+ZPOSr60l1fLnnMfzpfuNA1ovr
 JgWni7d+q78t7qeCKrFq5BH64wq38dY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-lHZuqqoFMuKf0gy5lTj8zQ-1; Thu, 04 Nov 2021 18:05:17 -0400
X-MC-Unique: lHZuqqoFMuKf0gy5lTj8zQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 v10-20020a1cf70a000000b00318203a6bd1so2869938wmh.6
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 15:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=55IgmPgmgSuFU9TD9sDvt/2ASWtxXb/fPvF+Rr/pBEI=;
 b=fhCwqRJ2uknKxtIsf+omr658zb6T4blmNwz2f54kcqqdJy1xlPhyYgtngVuFBFusHz
 GIhWv0EvYwMoZgJZAgCmbfB87Nguo0toZ9/Ef1DoE5OFAslv3G3gkuLY97e+v++2VubQ
 i2op+J9OfXU68LD2BWxhr5zUw1D1KGlnqeHudFoECqYeLh9ctNuC9O1i8eJeKfrbfBU3
 2sPqv3wvH7Lc1oQkWrxH7CT8Gk1ay2BzFICQF6KouysxQf/ZVeisiZgur1duYrMz1R0R
 SukQ78eZr9usDKWWwCHbneDKKBRUDlwKfZSQJOVQO+75cZPC0agBio8qc8aaJsfhUJPc
 M7JA==
X-Gm-Message-State: AOAM530S4YL1lqL81KzdtS8FIVE++7RwhAJ2r+ECLqg1H7TruUDc11tO
 mPq6GG1q4rWxRQC1QDUcKF27gpENT+Wot6VAv/IpFpK5GTVh+rm9E1pDMkx1z/R00PgLw/4NeHH
 0ozHW7x+x1X5ulpU=
X-Received: by 2002:a7b:c316:: with SMTP id k22mr27241682wmj.22.1636063516580; 
 Thu, 04 Nov 2021 15:05:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjuyOzFEoyPllk1OzGlmTypUNL8HrTM0i7sNCF1fqIwt5RxcZxT6UmP+XE0SaD8CiW4+dEaQ==
X-Received: by 2002:a7b:c316:: with SMTP id k22mr27241636wmj.22.1636063516364; 
 Thu, 04 Nov 2021 15:05:16 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id c17sm6507637wmk.23.2021.11.04.15.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 15:05:15 -0700 (PDT)
Message-ID: <6f8b30c5-d93d-882d-cf1a-502592e4bcf8@redhat.com>
Date: Thu, 4 Nov 2021 23:05:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 07/20] migration/dirtyrate: implement dirty-ring dirtyrate
 calculation
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <20211101220912.10039-1-quintela@redhat.com>
 <20211101220912.10039-8-quintela@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211101220912.10039-8-quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?B?SHltYW4gSHVhbmcow6nCu+KAnsOl4oC54oChKQ==?=
 <huangy81@chinatelecom.cn>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Juan,

On 11/1/21 23:08, Juan Quintela wrote:
> From: Hyman Huang(é»„å‹‡) <huangy81@chinatelecom.cn>
> 
> use dirty ring feature to implement dirtyrate calculation.
> 
> introduce mode option in qmp calc_dirty_rate to specify what
> method should be used when calculating dirtyrate, either
> page-sampling or dirty-ring should be passed.
> 
> introduce "dirty_ring:-r" option in hmp calc_dirty_rate to
> indicate dirty ring method should be used for calculation.
> 
> Signed-off-by: Hyman Huang(é»„å‹‡) <huangy81@chinatelecom.cn>

Just noticing in the git history some commits from your
pull request have the author name (from + S-o-b) mojibaked.

> Message-Id: <7db445109bd18125ce8ec86816d14f6ab5de6a7d.1624040308.git.huangy81@chinatelecom.cn>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  qapi/migration.json    |  16 +++-
>  migration/dirtyrate.c  | 208 +++++++++++++++++++++++++++++++++++++++--
>  hmp-commands.hx        |   7 +-
>  migration/trace-events |   2 +
>  4 files changed, 218 insertions(+), 15 deletions(-)


