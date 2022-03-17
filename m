Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66FE4DCA39
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 16:41:37 +0100 (CET)
Received: from localhost ([::1]:37726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUsFs-0007Wa-Km
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 11:41:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUsDR-0005mG-In
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:39:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUsDO-0004ew-RG
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:39:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647531541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vnIzS7NOXbMMfc7oI0COUo7VaKugObFje6vLEtJiPOI=;
 b=WEVGLW6HbOlPOO5mynL02Tr7Wev5o81KHfRwX5W4ory+x7S7S5JfkJiQ87rgeosCBd9v7i
 hj+ActfzY2OcTcn8/xz8aQWKy6xOHeO0CfEatM5aQV6J6+z2vumkp3nwvqAsacZfLt8sLW
 /gWT6HOf+uIY9fOMlA0+xuDkyUBWLbw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-iiwXwy1aPEic1TCcaLG0EA-1; Thu, 17 Mar 2022 11:39:00 -0400
X-MC-Unique: iiwXwy1aPEic1TCcaLG0EA-1
Received: by mail-ed1-f71.google.com with SMTP id
 cf6-20020a0564020b8600b00415e9b35c81so3324146edb.9
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 08:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vnIzS7NOXbMMfc7oI0COUo7VaKugObFje6vLEtJiPOI=;
 b=CqlAmKgbrla8ekfAEztopa9tki0zC8DOZp7D2L4+fvK6T06pv1zh7RuJOHjKB1/O2M
 Qc01nRVs0p/kjMZ1so2jkClYiP10yayj+fZcLsEgQuR/PWRcHmWQZZkJiGVl5jwZJood
 w+m1DDrUQYYFCCeO5nYw5hGqjYiMv5nnczTjj1uvXQFxTg0qaLjlm9KcmEccI1oqHpk7
 M5eic6mf6onKm/84zZdZGF8CaIQ2aXF1/J1Lkpifkp2/cklGS9VJPdyJwKPQqwCc3dxr
 TaH5oX31Ala08Uqwh6in1F2LTD8fHjo904NSrPgguO9zDWC8hNbKsngzrzXKNPh2OvF4
 SrRQ==
X-Gm-Message-State: AOAM5328PuwkD4J0Lu9fmaFC8QH1j4zMQzph74YKKijm3ZpYSsUSEEys
 wQigquDJpsr8a3Us2TDoq1VDERuEl9EVkBgblmHmLJ12Nt7hlObe4OqDnv5MdfkpdpKmUbMNYcS
 9sc/M/dixzyBWrIo=
X-Received: by 2002:a17:906:b6c7:b0:6db:2e14:875 with SMTP id
 ec7-20020a170906b6c700b006db2e140875mr4888649ejb.737.1647531539302; 
 Thu, 17 Mar 2022 08:38:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxU5M8+oCqdTN1bUQX9fHHp4x7UMQbZKAQQfUHBeR6p19bDq7+l1GPvmBRgBh6byhGHlpjdAg==
X-Received: by 2002:a17:906:b6c7:b0:6db:2e14:875 with SMTP id
 ec7-20020a170906b6c700b006db2e140875mr4888627ejb.737.1647531539066; 
 Thu, 17 Mar 2022 08:38:59 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a50fd19000000b0041614eca4d1sm2857537eds.12.2022.03.17.08.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 08:38:58 -0700 (PDT)
Message-ID: <38910bd4-7f8f-bdf4-29a0-f76f01d75ade@redhat.com>
Date: Thu, 17 Mar 2022 16:38:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 14/14] iotests: make img_info_log() call qemu_img_log()
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220309035407.1848654-1-jsnow@redhat.com>
 <20220309035407.1848654-15-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220309035407.1848654-15-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.03.22 04:54, John Snow wrote:
> Add configurable filters to qemu_img_log(), and re-write img_info_log()
> to call into qemu_img_log() with a custom filter instead.
>
> After this patch, every last call to qemu_img() is now guaranteed to
> either have its return code checked for zero, OR have its output
> actually visibly logged somewhere.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/iotests.py | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)

 From my POV, this is a regression because before this patch (not this 
series, though, admittedly), `img_info_log()` would throw an exception 
on error, and with patch 12 being as it is, it will revert to its 
pre-series behavior of not throwing an exception.  I prefer exceptions 
to failed reference output diffs, because an exception tells me which 
call failed.

Hanna


