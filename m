Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307FF618582
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 18:00:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqdYV-00051L-KV; Thu, 03 Nov 2022 12:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqdYU-00050s-9r
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:59:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqdYS-0006mH-Ny
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:59:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667494740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IxbK95KB0F35QnPNb98nwBm3fVi8YZf+GtBO4UWQALo=;
 b=MY0OdwYoieMwhg8G+eE8qJu9dyptE0EC+KHcVQDOYi/V3wkaHBrEMfNv3KJ9EBZ8akFJ7l
 iLzeVooJCalsMPxAS8lq5OJr2JiNqjIlyskAK27Ru4XiM59ibljb/mT70Ex/5FRNFh90R+
 qdpPTaLZd8ig6TePRbd13G4yLbj7WWE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-88-xmE1DlzyMiKqiO4uYMBJlA-1; Thu, 03 Nov 2022 12:58:58 -0400
X-MC-Unique: xmE1DlzyMiKqiO4uYMBJlA-1
Received: by mail-ed1-f72.google.com with SMTP id
 h9-20020a05640250c900b00461d8ee12e2so1794711edb.23
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 09:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IxbK95KB0F35QnPNb98nwBm3fVi8YZf+GtBO4UWQALo=;
 b=PNbCgqTPTHVrBdIgNj8GiJ69ZgvjWZJ5FsWWi3Zq2DeFQ9vO2IPUqz4ZvvGmamEMR8
 OFHxSe1i21uOo1jeA4jG+r9rSLbh6GWI/oVcfePkiYxH8HQ6k42yO45Dzneip/qFuYcl
 iIY0xhUoI8IkEWEm1vJExnuB1SrxhyQTzmSAGimbeh5rd6374SI0nQby4MNY1Kj/nf0k
 +FUy4GIeVpToeIEa6eRccCe3LyKJW2rOvR/uuQzEIyse20OnKyvefXeqFC571cV7Xcwg
 hVRM8DNbJYbzlnRREmoGKklvCcj4LZfdGaBWdLNP+EesgNtrGobJiJ/lVaOkyZEjErIr
 UDSA==
X-Gm-Message-State: ACrzQf2RFDgDr3WFxSel4nW4nV2vPn30EnI8bprOpZ7Ntd9Brd9Zd5cp
 djUsZDEi9aHbZIUhz9D8lYc678uwR3fRoLl8cUtMHf4A9KdGjzF3tR14xeno4MCb6xXTe4AVZMD
 h9/liDj1LBkl8zHY=
X-Received: by 2002:a17:907:d93:b0:7ad:8319:d095 with SMTP id
 go19-20020a1709070d9300b007ad8319d095mr29407320ejc.511.1667494737602; 
 Thu, 03 Nov 2022 09:58:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4JuPW2UnbUG+HlX4f5l4mGtphNyX+i4QWbs5VdAuAgzTrbp/SnrZgn0MfFVrjinpA5lbtidg==
X-Received: by 2002:a17:907:d93:b0:7ad:8319:d095 with SMTP id
 go19-20020a1709070d9300b007ad8319d095mr29407306ejc.511.1667494737405; 
 Thu, 03 Nov 2022 09:58:57 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 fn15-20020a1709069d0f00b0078defb88b0dsm711331ejc.73.2022.11.03.09.58.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 09:58:56 -0700 (PDT)
Message-ID: <17347a1a-85fd-06dd-9aea-bb83647f51ea@redhat.com>
Date: Thu, 3 Nov 2022 17:58:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 3/9] nbd/server.c: add missing coroutine_fn annotations
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20221103134206.4041928-1-eesposit@redhat.com>
 <20221103134206.4041928-4-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221103134206.4041928-4-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/3/22 14:42, Emanuele Giuseppe Esposito wrote:
> There are probably more missing, but right now it is necessary that
> we extend coroutine_fn to block{allock/status}_to_extents, because
> they use bdrv_* functions calling the generated_co_wrapper API, which
> checks for the qemu_in_coroutine() case.
> 
> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>

generated_co_wrappers should only be called from functions that are 
*not* coroutine_fn.  If they are coroutine_fn, they can call the 
bdrv_co_* version directly.

See for example 
https://patchew.org/QEMU/20221013123711.620631-1-pbonzini@redhat.com/20221013123711.620631-17-pbonzini@redhat.com/.

Paolo


