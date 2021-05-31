Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4E23966A7
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 19:14:21 +0200 (CEST)
Received: from localhost ([::1]:48896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnlUa-0002C8-Ra
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 13:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnlSN-0008BZ-Bg
 for qemu-devel@nongnu.org; Mon, 31 May 2021 13:12:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnlSH-0008RT-9f
 for qemu-devel@nongnu.org; Mon, 31 May 2021 13:12:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622481116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LRbATEY69ndls/SGpuKBQ01hmWvNmI9JrRGVt40CeE4=;
 b=d/5B1/o84C+nAejQAjsKJ886iENLhL5dZWIw+EajTV/8mSkhajJ09wFojOGf8Ee7Co+Ajd
 JqrDLX04DCxtLY/RGLb381zMLfMd41SnTbOqxeaXc5vdoTUysy/qKJnU3Z4692Qc8HOUZc
 2fgQzEC4uA46f4Isb+iCsyQyP6Gy9E4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-V_-dw3rfO3OBMl_DkU2gog-1; Mon, 31 May 2021 13:11:55 -0400
X-MC-Unique: V_-dw3rfO3OBMl_DkU2gog-1
Received: by mail-ed1-f70.google.com with SMTP id
 x8-20020aa7d3880000b029038fe468f5f4so1529794edq.10
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 10:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=LRbATEY69ndls/SGpuKBQ01hmWvNmI9JrRGVt40CeE4=;
 b=h7ngtZc06TECJ2KJ23LPlG5E9wZV/4YfSwm19mXdE1sEhdwBIGhUxMVp2rWYPK1FPc
 DrY7u89voj2SJniDMnmVw3tDIvH7uFEUwuh/T/lgMoKF8i4crmYH7ioweFdvL1Fg68mo
 T23uJmagy+A1T45Qn3iKPCgfHermEC8jPLVXadmGYWMnN9058SoAzygyU5no1EgqjwVa
 LJDEHedDCuBE6GeMD6Wr2D1nRsyQpzCyPmToFMpvBtUspsIq2otnC6qRYWy940ABHYbC
 bFFpiBbYRCCir/W+9F1sg2yjlg73q4EBf8vvGGkVFGmxG3A8aDN8qLUyym6Rkuqy1Tg0
 kKPw==
X-Gm-Message-State: AOAM531PksHH9V6anWt1PrXx0ppp6AdCWzjlVmYVcFT1I8dCeatb13ZM
 TqKgkTy73mICCo93AuLQCpksNoakjFc6qSNRrqQiTuVrBjS2gHbR5LAB86wE1q3Q7omOLftyLl8
 EY78zrPnWAGtp/YM=
X-Received: by 2002:a17:906:b14f:: with SMTP id
 bt15mr24892682ejb.126.1622481113991; 
 Mon, 31 May 2021 10:11:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5wb8BL2o41ObO/BmRYa8wO6MUK4IJ4P/EQTUpEiMI88TygcdoH9v0XwBr2D/Ndwu9pNLZsg==
X-Received: by 2002:a17:906:b14f:: with SMTP id
 bt15mr24892667ejb.126.1622481113870; 
 Mon, 31 May 2021 10:11:53 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 m13sm7140384eds.21.2021.05.31.10.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 10:11:53 -0700 (PDT)
Subject: Re: [PATCH v2 00/33] block: publish backup-top filter
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <f0dc2c94-b75e-6530-e986-22100ea2fcb7@redhat.com>
Date: Mon, 31 May 2021 19:11:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-1-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com, den@openvz.org,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.05.21 16:21, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
>
> v2:
> 01-02: new
> 03: don't bother with supporting empty child: we should never have such
>      at this point
> 05: add comment
> 06: keep checking conflict with global
>      add realized_set_allowed to qdev_prop_drive_iothread
> 07: improve cbw_cbw() name
>      improve commit message
> 10: rebased on unchanged backup_calculate_cluster_size(). keep r-b  CHECK ME

I checked you! It’s ok. :)

(and btw, I’ll look at the rest tomorrow)

> 12: new
> 13: drop extra bdrv_unref()
> 18: add compress local variable
>      add comment about x-deprecated-compress
> 19: new, replacement for "[PATCH 17/21] block/block-copy: switch to fully set bitmap by default"
> 22: improve qapi documentation
> 23-33: test: a lot of refactoring


