Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F036BE420
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 09:45:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd5gQ-0007tU-Fk; Fri, 17 Mar 2023 04:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd5gL-0007sc-LY
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:43:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd5gJ-0006Tv-R8
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:43:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679042602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BVmL7ZIakAcmY9BF78doPGdjHEPzVDpz6OhckmVz/ig=;
 b=ZmbuPavs7mfJLUFpGduFS6xRH71X2rm3jPxCJBIeC/yhen8xqc8e7HCp6GrMqDySYfxHNp
 KsMUMtioU8/DQJjqOsg1Km05Gq/G1OrHTVquq8OYSvJQK3i+ORgnWe6Rv1e8EWbPR+yCcf
 KHqsivCXSuIgcLj9Z++ROB7DlbxDMs0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-Omw5NefVOhGtTA8OLMqqwg-1; Fri, 17 Mar 2023 04:43:15 -0400
X-MC-Unique: Omw5NefVOhGtTA8OLMqqwg-1
Received: by mail-wm1-f69.google.com with SMTP id
 n18-20020a05600c501200b003ed24740ea4so3961592wmr.3
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 01:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679042594;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BVmL7ZIakAcmY9BF78doPGdjHEPzVDpz6OhckmVz/ig=;
 b=epkOqmYOrHSHuyDc7cVqo5r9AR1w76lc9XW3MmbcAeUR2s+n/+PrnTsAsXMRNY70G8
 Pi4I2z/7wCvGZ/yT46EpSHDlp1BiU715BZaSODOdT6529CwWMYK21vmJjSTXYlZgzKwV
 CLNK7Sb3aIyKDUl72cJKWz/39pFtZr6mU8SbLQ9XNk9eiGcSiDcktVbZysPJ0IgY0L2r
 l0kTt7dQYaODFwowzfwLvLu9uS7WMJhGKc1Pvrr/q4j9OGPHFIiFlDmVyvqmDaMxu5yp
 uunRWQc797cHsbpN2sXgBmR43CDfyFOeMYfzt31SWRnl/SHJ87ZfhVKpxD8AAEzoGhTN
 3Pug==
X-Gm-Message-State: AO0yUKVyppimY1im8FWJn0LcZi9MSaLfWKKhrxEt7S0cSd1wLLw8NZ0w
 xhfcM377SxFADVe2siXUoFdpjwooWlLMOFL17BQ4O+vIc3C56aUDRIxI5smGCyK9P9Djdn/yScI
 07KtLxmNf/viOiDY=
X-Received: by 2002:a1c:7314:0:b0:3eb:3998:8c05 with SMTP id
 d20-20020a1c7314000000b003eb39988c05mr1678308wmb.6.1679042594175; 
 Fri, 17 Mar 2023 01:43:14 -0700 (PDT)
X-Google-Smtp-Source: AK7set+1hC2liG2r2m+01cym7Cwax7c3Y0cTyVKg3AF28UMSfs83HcV3UcSnG5bsiUhKsTbU3t8New==
X-Received: by 2002:a1c:7314:0:b0:3eb:3998:8c05 with SMTP id
 d20-20020a1c7314000000b003eb39988c05mr1678300wmb.6.1679042593947; 
 Fri, 17 Mar 2023 01:43:13 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-33.web.vodafone.de.
 [109.43.176.33]) by smtp.gmail.com with ESMTPSA id
 a3-20020a05600c224300b003eae73f0fc1sm1346065wmm.18.2023.03.17.01.43.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 01:43:13 -0700 (PDT)
Message-ID: <ae1a8740-f220-b4c3-081a-d771b88d7039@redhat.com>
Date: Fri, 17 Mar 2023 09:43:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 12/12] tests/tcg/s390x: Test unaligned accesses
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20230316164428.275147-1-iii@linux.ibm.com>
 <20230316164428.275147-13-iii@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230316164428.275147-13-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/03/2023 17.44, Ilya Leoshkevich wrote:
> Add a number of small test that check whether accessing unaligned
> addresses in various ways leads to a specification exception.
> 
> Run these test both in softmmu and user configurations; expect a PGM
> in one case and SIGILL in the other.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---

Thanks for reworking this! It looks much nicer now, indeed!

Reviewed-by: Thomas Huth <thuth@redhat.com>


