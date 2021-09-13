Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3F6408B11
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:29:07 +0200 (CEST)
Received: from localhost ([::1]:56534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPl58-0002xE-Fy
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPl1e-00005H-1N
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:25:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPl1b-0007vd-9y
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:25:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631535926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=09NK0GfTLISB9Ey47QACVdz580PoyZh6uiObghsNr88=;
 b=ClSvMsth6SjT7iZIUevm4VnjoFyR8DTfzgcijgWoT9KMpysJr0vLgNhvauf+JCCt06M3y5
 gKhkPaQ9DT9CbowR9WO/GPWNklhKnh12Vjvq7U09C7ngzvuO9eoqKzHm5tqxzXOI9zoy0l
 tWZaJmhRia4NHHeRlZ6eBfHpv6Bx6T0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-_Od9q86GM_6GHTLe5dKfAA-1; Mon, 13 Sep 2021 08:25:24 -0400
X-MC-Unique: _Od9q86GM_6GHTLe5dKfAA-1
Received: by mail-wr1-f69.google.com with SMTP id
 x2-20020a5d54c2000000b0015dfd2b4e34so926655wrv.6
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 05:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=09NK0GfTLISB9Ey47QACVdz580PoyZh6uiObghsNr88=;
 b=A5mCdHeSanPWriZ/WKgC7mMQ7aOV9+7zslE3G/uXmUBkUhJpXUsvZ6lBx/uXPD7/Cl
 lHVXhkir+HWdYmhOL8bpdhRjW0uAwrq8m9CRlNul7FpCY2Wd+GjLEndOKnANjfPEAr1T
 12Hm+BkYEdxSUW9Iz7TpVrlQrQGrhuNNQV1q5DIoCitGurrHf3BFoPsz5CIg96Sx/259
 rYTrOBO8wQZXoS3cF/RxZCKjbkZljQWHCLQjqgUoFR/H14MowIG+2f9imWlztCJrdRpC
 ielQA96QJMyBDyGDMLeEJo0vFM7AW+0DtzsN2p+G6L3mifDF3xW/AZSH8kUezK6nd4eo
 iKLQ==
X-Gm-Message-State: AOAM531bKhIte9hMxJChTwY2eOA1DdoCxogW6vTJgMlJb1xzNudhRkRp
 +IFLwr8HaSOmH9kwsUzHhHsycmIBjnwbrYxCpmpX5YnArqDJzjfBF3wESghVumLmog+vA1ggmD2
 SnlHozBpdST2kNWY=
X-Received: by 2002:adf:eb83:: with SMTP id t3mr11976004wrn.365.1631535923865; 
 Mon, 13 Sep 2021 05:25:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWeF/ZC/wRYCP8vu8EZ9GSdnxNE90mRbvyshgFM6sH1kk9kkgkf7YV+POniO24BXYwQaLTjQ==
X-Received: by 2002:adf:eb83:: with SMTP id t3mr11975976wrn.365.1631535923653; 
 Mon, 13 Sep 2021 05:25:23 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id i9sm6842242wmi.44.2021.09.13.05.25.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 05:25:23 -0700 (PDT)
Subject: Re: [PATCH v2 14/17] iotests: bash tests: filter compression type
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210720113832.586428-1-vsementsov@virtuozzo.com>
 <20210720113832.586428-15-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <b8b544df-0178-bf60-006e-76cd2cf14f05@redhat.com>
Date: Mon, 13 Sep 2021 14:25:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720113832.586428-15-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.07.21 13:38, Vladimir Sementsov-Ogievskiy wrote:
> We want iotests pass with both the default zlib compression and with
> IMGOPTS='compression_type=zstd'.
>
> Actually the only test that is interested in real compression type in
> test output is 287 (test for qcow2 compression type), so implement
> specific option for it.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/060.out       |  2 +-
>   tests/qemu-iotests/061.out       | 12 ++++++------
>   tests/qemu-iotests/082.out       | 14 +++++++-------
>   tests/qemu-iotests/198.out       |  4 ++--
>   tests/qemu-iotests/287           |  8 ++++----
>   tests/qemu-iotests/common.filter |  8 ++++++++
>   tests/qemu-iotests/common.rc     | 14 +++++++++++++-
>   7 files changed, 41 insertions(+), 21 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


