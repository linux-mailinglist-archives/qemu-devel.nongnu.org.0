Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BEF53FADE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 12:09:59 +0200 (CEST)
Received: from localhost ([::1]:40770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyW9t-000265-VU
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 06:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nyVy6-00020u-OI
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:57:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nyVxt-0004Tl-Dl
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:57:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654595852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x57Qw6JKSglEY76ieNetgEtpUIMazMZP7E4lL6z2Cbk=;
 b=eUv5M9It9dTno7O8qm4ZVLqqdtktPWyrYHmaUW5NxGRsv/C8suQgdB8qX+S7A+KYRw1KOz
 bWuy0Mu0hnjzYrjeTOcD/g3N3TrQhcM3Ztr7oTO2f1T4XkeeFNVXkCeEfCxzEJer4ghcsJ
 xUvGey1B98Oc4LDGa/ge9kDwMGvgQUQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-ztGzMfnUNI-fYu3FEVVXvQ-1; Tue, 07 Jun 2022 05:57:31 -0400
X-MC-Unique: ztGzMfnUNI-fYu3FEVVXvQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 o18-20020a5d4a92000000b00213b4eebc25so3059090wrq.21
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 02:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x57Qw6JKSglEY76ieNetgEtpUIMazMZP7E4lL6z2Cbk=;
 b=UcAHhOS0IXXVDBlO96C3nylRw4YzJrGdTJCzR8IdY1AkksXVP9fSvTunRuwzr33PEz
 Gio6tIHQI3Vst8EPezd0mvoU/YpRbvnvhFESrj/y5B8jKkrYSvAYqA12XomEWHlpV1l8
 veu5qWQEVX67DSxmNtSHEGrUYeY35iA7KpRMRNf9wFkVg3Y1Qn7I1d/L8cWxO22QGjR5
 Y9779Of8hDDLP5O7bHSEQPJXVRnAiFXwpBUw2rNdeboDWZiBbq4tGB1kDdap9ieXCn+k
 fAq5Cb63lPIXT52mbpDPq/CRnmiGZViLsU8hxp6ums9FzTfpRrSA4EKZ89I8jDbaYrJr
 7xwg==
X-Gm-Message-State: AOAM533azgQ9YahHJgsTSsC7vZSXugeNf4Ro6zxiKoHeiNVdFn+SGpDq
 Rskls/mR53yFCqFQgNlDHiHVZ0tnc8fRPhobiTsdIzGKhCEUGHv92h1JHIoy6SJFG4IofE9ElTE
 Yam0HxxHG/lhCEy4=
X-Received: by 2002:a05:6000:1883:b0:205:c0cb:33c6 with SMTP id
 a3-20020a056000188300b00205c0cb33c6mr27335621wri.39.1654595850115; 
 Tue, 07 Jun 2022 02:57:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6rZer92bvI1LsFOQZqvAugZpfGLpUnQez18t0eXbyxaSXSZkPn1BilUmqRgaCbbXTdS5Zgw==
X-Received: by 2002:a05:6000:1883:b0:205:c0cb:33c6 with SMTP id
 a3-20020a056000188300b00205c0cb33c6mr27335600wri.39.1654595849949; 
 Tue, 07 Jun 2022 02:57:29 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a05600c1d1800b00397342bcfb7sm20550146wms.46.2022.06.07.02.57.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 02:57:29 -0700 (PDT)
Message-ID: <369d4c33-1905-fac0-1f9f-81e8e1ef46a7@redhat.com>
Date: Tue, 7 Jun 2022 11:57:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 01/45] block: BlockDriver: add
 .filtered_child_is_backing field
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru, John Snow <jsnow@redhat.com>
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-2-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220330212902.590099-2-vsementsov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
> Unfortunately not all filters use .file child as filtered child. Two
> exclusions are mirror_top and commit_top. Happily they both are private
> filters. Bad thing is that this inconsistency is observable through qmp
> commands query-block / query-named-block-nodes. So, could we just
> change mirror_top and commit_top to use file child as all other filter
> driver is an open question. Probably, we could do that with some kind
> of deprecation period, but how to warn users during it?
>
> For now, let's just add a field so we can distinguish them in generic
> code, it will be used in further commits.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   block/commit.c                   |  1 +
>   block/mirror.c                   |  1 +
>   include/block/block_int-common.h | 13 +++++++++++++
>   3 files changed, 15 insertions(+)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


