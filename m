Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E438446DAA
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 12:42:49 +0100 (CET)
Received: from localhost ([::1]:58366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjK5v-0002IW-RD
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 07:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjK1X-0000qN-ID
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 07:38:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjK1S-00034a-Ig
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 07:38:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636198689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Av8bXU4Zc5lO2JuH5f6T6VdQt71IioMp3pXW0qn1FBA=;
 b=bigK9QXyrtW5W+ZDzsCS70wua+rtpYMMffOB5auQFxvInDbKC4GNhCTF950JE6BrIiUVHi
 nvfGD9SpXAg9BZqQ2mpbtgikuXXeOJtDdVtkMA24sY0H9NDpGsSmpKL2qgrbfU3/PEe/2f
 8ZVRnOB7Jw4P+pR4lVJ2xXLBWd3nMQE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-x9liW-2xMviY3XoRmj9X9w-1; Sat, 06 Nov 2021 07:38:08 -0400
X-MC-Unique: x9liW-2xMviY3XoRmj9X9w-1
Received: by mail-wm1-f70.google.com with SMTP id
 128-20020a1c0486000000b0030dcd45476aso4698086wme.0
 for <qemu-devel@nongnu.org>; Sat, 06 Nov 2021 04:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Av8bXU4Zc5lO2JuH5f6T6VdQt71IioMp3pXW0qn1FBA=;
 b=yfY7VhwBz+7Ve8soJiKa5b7YgMTQ8pHW8xZA4r//u0YY2mTBCEpAbRwO/9C/HO1Crn
 hWMaTAiSltOUILdZZ3KmbI2dHjOTb4o+yBDq5rXFb9pgMDHxXsMGDgzjEOw5a3FYSUH0
 cBkNgF+6on/JfrL802ZbxLZS8/7KCJvxdj3+mvupnkrAJeJUpn7QQ0dxvbb0rgqhhciN
 oPLFoWYoHmg//r65RSyGKqgU1wHse9pgfLfshCQIKkfoHpympRl84TfS+SjCy0cteTJM
 cUJJ0/7MwplnTnBz3ujm2i5zVpybq9q8ppypXGOmAxJEljwmFm5yRkRt7OR8iHtY4H/6
 tqfQ==
X-Gm-Message-State: AOAM531fPkb0ncRZGtlO7XHon1is4nOYLgeUyGET2JF23/m8+nmVwkj/
 IZ7TS/ovVuwPTfp2d78729U74Yo5e2PMY9zpARJjWfeOT4JHe5vH8QvsWXX0ixEdNjd40X2xDRA
 oFNLqqxdbzkpLA770QBbzgukZyGMIGwjKvrTqIwpmTbr8g50gx9ihGKo21HZ2O/tq
X-Received: by 2002:a7b:c4c4:: with SMTP id g4mr36479984wmk.93.1636198686611; 
 Sat, 06 Nov 2021 04:38:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyY46H/TfMfYwsBipyo+YWZy7oEgOpwvDHnrHpLWyqqvCIV7dQMcjiFBRPT7B3+v0g7kw+rTQ==
X-Received: by 2002:a7b:c4c4:: with SMTP id g4mr36479952wmk.93.1636198686333; 
 Sat, 06 Nov 2021 04:38:06 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f15sm10093392wrt.26.2021.11.06.04.38.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Nov 2021 04:38:05 -0700 (PDT)
Message-ID: <13b323ae-e334-1daa-d487-9a4b1a63c7ef@redhat.com>
Date: Sat, 6 Nov 2021 12:38:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v7 0/2] memory: Have 'info mtree' remove duplicated
 Address Space information
To: qemu-devel@nongnu.org
References: <20210904231101.1071929-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210904231101.1071929-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.735,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.407, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping?

On 9/5/21 01:10, Philippe Mathieu-Daudé wrote:
> Series fully reviewed.
> 
> Follow Peter Maydell suggestions:
> - Split mtree_info() as mtree_info_flatview() + mtree_info_as()
> - Remove duplicated Address Space information
> 
> Since v6:
> - Added missing vertical whitespace (rth)
> - Added rth's R-b
> 
> Since v5:
> - Fixed messed up during v3->v4 (peterx)
>   . Restore format
>   . Remove unused 'int counter'
> 
> Since v4:
> - Merged patches 1 & 2 (David)
> - Remove unnecessary return void (David)
> - Added David R-b
> 
> Since v3:
> - Fix typos
> - Split mtree_info_flatview() + mtree_info_as() first
> - Rebased last patch keeping Peter's R-b tag
> 
> Since v2:
> - Removed unused AddressSpaceInfo::counter
> 
> Since v1:
> - List AS similarly to 'info mtree -f' (peterx)
> 
> checkpatch warning (81 chars):
> 
>   WARNING: line over 80 characters
>   #86: FILE: softmmu/memory.c:3359:
>   +                                  address_space_compare_name);
> 
> Philippe Mathieu-Daudé (2):
>   memory: Split mtree_info() as mtree_info_flatview() + mtree_info_as()
>   memory: Have 'info mtree' remove duplicated Address Space information
> 
>  softmmu/memory.c | 150 ++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 108 insertions(+), 42 deletions(-)
> 


