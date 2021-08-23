Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DB63F516B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 21:40:56 +0200 (CEST)
Received: from localhost ([::1]:60434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIFDJ-0002cM-Pi
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 15:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mIFAW-00013G-F7
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:59:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mIFAS-00075C-LW
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:59:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629745171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bFmigRs8XC+p6jbi5ZgMA+6f5TYnoDYbU94VVUbxvNM=;
 b=dCRDL3BbiSRCvuZd2siTvorbJtF8QxgkbMk39+qrppfdKM51OBjVqmoeGsYzpjed93SQA4
 TeHV8Dn5fpJlfI1p9I5w/yhBisL8vgfjU8cYUuREhfvyUdGk9FyPgce3ccV+kl3+6x133t
 5TSLPZUbQPN2Bx/dFjhiCo9pqi6kufw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-3PWLv4vAMtetFGjYuvbyXA-1; Mon, 23 Aug 2021 14:59:29 -0400
X-MC-Unique: 3PWLv4vAMtetFGjYuvbyXA-1
Received: by mail-wm1-f72.google.com with SMTP id
 z186-20020a1c7ec30000b02902e6a27a9962so82124wmc.3
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 11:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bFmigRs8XC+p6jbi5ZgMA+6f5TYnoDYbU94VVUbxvNM=;
 b=rQoKMfG5ktNO1xCCO7Onf/daTim84P+d1Rw6vfgVTAGdKJLjuL4GgG8k+zNlJxKQOv
 E4eGA4zeViB02BA0vaS8FvrpEk6wiubiOYpICHtk6DTh9+5nJtG72bUSfrTwFlUiy98x
 0ikI0VpQzJzPZm49pmljbjX1wnwhoet9f1c3EKk6yjVGzN3pP1guBtLZPMfp0aNvG+cy
 +f8rxackxMtxoD8Bnrw7m0kvp/Q3YwlLUGCjMUpspz4+l6QoSs/VajESqI+bzf4+s3AV
 iZDUMGtgaBg6gz8EQN+0BSba4Lu1215VIgZD/MLXzegQfpBZkCBAotXEnCs+c6lGCtRx
 np6Q==
X-Gm-Message-State: AOAM532Uozvv0J1zzJIGDYv8+M8PdzDAxL/T0voxR8zVLUIgfw1B5Oeb
 LROfev9H6rf6+TM1qQMcGjJqdr1jxNuywFsl7/5QdFsd9T+EIXM0OVyi9Yk5FQPqGSen7SK9jkU
 SpxKu2olynVzRMI8=
X-Received: by 2002:a1c:7e12:: with SMTP id z18mr55473wmc.60.1629745168751;
 Mon, 23 Aug 2021 11:59:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8rX+wndtsw/Em+VPFfq7eg/ZEUn8lBsYcVPv4RRrKDnuVKb+jY3tPmFSaKoN99R0GWnFBxQ==
X-Received: by 2002:a1c:7e12:: with SMTP id z18mr55435wmc.60.1629745168434;
 Mon, 23 Aug 2021 11:59:28 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c60c6.dip0.t-ipconnect.de. [91.12.96.198])
 by smtp.gmail.com with ESMTPSA id
 t11sm31320wmi.23.2021.08.23.11.59.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 11:59:28 -0700 (PDT)
Subject: Re: [RFC PATCH v2 1/5] softmmu/physmem: Simplify flatview_write and
 address_space_access_valid
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-2-philmd@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <8e8b1295-b6ba-0ac7-02fc-c347dccd1ce5@redhat.com>
Date: Mon, 23 Aug 2021 20:59:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823164157.751807-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.08.21 18:41, Philippe Mathieu-Daudé wrote:
> Remove unuseful local 'result' variables.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


