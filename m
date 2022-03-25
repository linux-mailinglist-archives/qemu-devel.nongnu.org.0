Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A8F4E7507
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 15:26:54 +0100 (CET)
Received: from localhost ([::1]:42332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXktw-0000HO-Kz
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 10:26:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nXkrn-0007kH-0W
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:24:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nXkri-0007T1-Bf
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:24:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648218273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/j88KKHh9fEaAsNL22aDovh4T36MS5WjJZ7fWwnqkak=;
 b=fimSMglldk6h7KSxYroJ3fBRBN5VQ8tSLqjlV0woscoHRH5/30e0kvOiAz7o3DCJ9pwjeN
 yj7OxLv4nSOI2p00wMFGtErpM3n0iXZBfRO4lcximvHqNKH/hnCQp0jMtpek1L7dvzhcnA
 GGpGOmkMLwpHVt82+SXLhDpwBUK+1bE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-BwMCmHmuNRiE8AK4cbn7dQ-1; Fri, 25 Mar 2022 10:24:32 -0400
X-MC-Unique: BwMCmHmuNRiE8AK4cbn7dQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 d28-20020a50f69c000000b00419125c67f4so5029116edn.17
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 07:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/j88KKHh9fEaAsNL22aDovh4T36MS5WjJZ7fWwnqkak=;
 b=izLY/FfWVSuSZLv+1HsG5qxyGwzPeDma+j1jPC7aatkq7Me/r15yLkkwaC28lT2l/w
 8ge1j1O5bRdLgJb0QaRKQH9Z2hRpUMEXlf4USxyejHTQR94ud0g+OVYCJbA3fYTOtYhb
 ZgHvrv5cDJAFAKRF0D+h2LoRFrYsTpbkxamEHxC+SfqhxhtcN/YlHb3DE2Fci1keJHSE
 loz97pSimBJnf0IRnS2fG8xU3GgzsAosverKk+1sxQYJQusQeArx6qc+IFweH+apRWfj
 d4enpefs6zdyX6eMOqjIixzl8yvxotfOWJyvtwJLtlEJFVIv+yNsyK1rRONGE8HR86GN
 5GXg==
X-Gm-Message-State: AOAM530KKLwLLEUk4XmvEoE8p1smplDHszTq3BRX0ojM8wDrN2EyxwQf
 sYrGvRNouW+tKYhEYbdlsYyAFHYixxOeXAKZBHeo02+mlVpDl5yWevDdeBXyuDja953V3ETP9AS
 jTy1/kcHNkXce/T4=
X-Received: by 2002:a17:907:6d11:b0:6df:f38b:b698 with SMTP id
 sa17-20020a1709076d1100b006dff38bb698mr12008755ejc.711.1648218271205; 
 Fri, 25 Mar 2022 07:24:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLdGlb5I7bcZ6pSj280NisSP1TrbD1/5HK1dtbf9pn83b25wMq67Mb954AuEUxpsUG/UwjwA==
X-Received: by 2002:a17:907:6d11:b0:6df:f38b:b698 with SMTP id
 sa17-20020a1709076d1100b006dff38bb698mr12008738ejc.711.1648218270941; 
 Fri, 25 Mar 2022 07:24:30 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 qk32-20020a1709077fa000b006df6bb30b28sm2353960ejc.171.2022.03.25.07.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 07:24:30 -0700 (PDT)
Message-ID: <e0984f89-b956-562a-4594-f53f28395972@redhat.com>
Date: Fri, 25 Mar 2022 15:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 14/17] iotests/image-fleecing: switch to qemu_io()
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220324183018.2476551-1-jsnow@redhat.com>
 <20220324183018.2476551-15-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220324183018.2476551-15-jsnow@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.03.22 19:30, John Snow wrote:
> This test expects failure ... but only sometimes. When? Why?
>
> It's for reads of a region not defined by a bitmap.

Ah, yes, right.  The bitmaps defines what regions are to be backed up, 
so other regions are not covered by the fleecing scheme, and might be 
invalid if read.  Hence the errors.

> Adjust the test to
> be more explicit about what it expects to fail and why.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/tests/image-fleecing | 28 +++++++++++++++++--------
>   1 file changed, 19 insertions(+), 9 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


