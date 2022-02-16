Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698AC4B9224
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 21:15:55 +0100 (CET)
Received: from localhost ([::1]:57514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQiQ-0003ke-4o
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 15:15:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKQes-00010b-FS
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 15:12:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKQen-0001xk-RC
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 15:12:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645042328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GxqteEPQMmpBubp2xvDcCo+dZVQSs/2t52pxLc+xMI8=;
 b=cifb2yqvjBbnavemXBhHhSgDCs2Okb0nUUJIM3cz+AW1MJMnfwMYle/87CzzZX0nCNNnS/
 ZWL47ZMLmTUf8e1R6PwBeNKnYbBvZ4zBFCN7Br8zd9KVIbi0F8paKhJ9xwEyz/PzI7KIMQ
 H1WzHzlFdSCMlTxOvJa0mvQhmeBOg/I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-e1T1dtHzN1yAIZtywbnb2A-1; Wed, 16 Feb 2022 15:12:07 -0500
X-MC-Unique: e1T1dtHzN1yAIZtywbnb2A-1
Received: by mail-wr1-f72.google.com with SMTP id
 v17-20020adfc5d1000000b001e6405c2b56so1489663wrg.7
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 12:12:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GxqteEPQMmpBubp2xvDcCo+dZVQSs/2t52pxLc+xMI8=;
 b=WAcGEVXk9wdVQ7qulzb/w7ea6gTpQFLAdQ0J6Qa05U8dgCMtY6xp8mnl+rnKxK7iic
 Kqs4R9AdHz40Oi/+kJHaoMp8ik9DpW0drWPkmqQ1BJ/SIsHp+YGntspkCGxe7+CPEgd4
 r9d0VJ6vP/G4bo2nwMgza6eNeCFu2A/glQlt1aL58diNQptl7KlHqceK3g9aG7Ad+tlC
 ITDF+0PHuclDpvOMYkKnsHSE2ezKrsRnJQRICxBv5/HqEmPLwJr50CjK8YbIMPyAMNPm
 GfvAd2Xae5vnn5L6MyuHOi/cALVTtSNw0nA61DiJFrXzy9U2u9wt+oxDf6nl5bl+Gzp1
 lOOg==
X-Gm-Message-State: AOAM530IWjp4TXsyuxCTgKCZ++OhSSmjmhXTt9/jaBhm2Si/4ugatj27
 LZKv9Dcmyrcc+l6rn4Xkr2KZfFnIMh2SQPiGAQtIMHgL8N8CFPrQSpoQ+P+6PZ4mWnjVIqDxYxA
 dpXR9ST5R0l6uu/U=
X-Received: by 2002:adf:80ad:0:b0:1e3:238a:178e with SMTP id
 42-20020adf80ad000000b001e3238a178emr3657895wrl.551.1645042326045; 
 Wed, 16 Feb 2022 12:12:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKTmcDUBN/5WBkP2lGZPGrOcA9JiOVdjxYtaMdmihCloflFKusdhCXumkLeI7yw+HgNG263A==
X-Received: by 2002:adf:80ad:0:b0:1e3:238a:178e with SMTP id
 42-20020adf80ad000000b001e3238a178emr3657881wrl.551.1645042325735; 
 Wed, 16 Feb 2022 12:12:05 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:600:4ff7:25c:5aad:2711?
 (p200300cbc70b06004ff7025c5aad2711.dip0.t-ipconnect.de.
 [2003:cb:c70b:600:4ff7:25c:5aad:2711])
 by smtp.gmail.com with ESMTPSA id n11sm20323014wms.13.2022.02.16.12.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 12:12:05 -0800 (PST)
Message-ID: <77a3f82f-61ee-f184-4ac3-210ae062898d@redhat.com>
Date: Wed, 16 Feb 2022 21:12:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 1/3] s390x/tcg: Implement
 Miscellaneous-Instruction-Extensions Facility 3 for the s390x
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220216200355.128731-1-dmiller423@gmail.com>
 <20220216200355.128731-2-dmiller423@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220216200355.128731-2-dmiller423@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 farman@linux.ibm.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>  
> +/* SELECT */
> +    C(0xb9f0, SELR,    RRF_a, MIE3, r2, r3, new, r1_32, loc, 0)
> +    C(0xb9e3, SELGR,   RRF_a, MIE3, r2, r3, r1, 0, loc, 0)
> +/* SELECT HIGH */
> +    C(0xb9c0, SELFHR,  RRF_a, MIE3, r2, r3, new, r1_32h, loc, 0)
> +

Heh, note how I inverted r2 and r3 in my proposal? That's because op_loc
expects them in different order! With the current order, mie3-sel
actually fails (good!).

Apart from that

Reviewed-by: David Hildenbrand <david@redhat.com>

Thanks!

-- 
Thanks,

David / dhildenb


