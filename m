Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C005D3E5C5D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 15:56:43 +0200 (CEST)
Received: from localhost ([::1]:37752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDSFG-0002Bo-LY
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 09:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDSCf-000849-D3
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:54:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDSCc-0002Vk-Pq
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628603637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xBp48UISmIDP5FV2zec7nCn1A3rYJVu23pgPNEO4xzs=;
 b=EaFW4ykHyR96npEVLrkVOM0jHxVVzi+jDlxKaADumSbK4x5kmRhe1qG9Oz/IuzV9CKmlzi
 VMeCrf9es+ZzLAzAFJ4HZIrSXnELg/8y2VuPXooHJPvPgVV3YT8ud13bhoB9mtN6xQxH6J
 ISqPiAIA9CVcxAnpjQUahozNPmkjVbM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-YMETI7daPeOKibG8t_0CMA-1; Tue, 10 Aug 2021 09:53:54 -0400
X-MC-Unique: YMETI7daPeOKibG8t_0CMA-1
Received: by mail-wm1-f71.google.com with SMTP id
 r125-20020a1c2b830000b0290197a4be97b7so1018494wmr.9
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 06:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=xBp48UISmIDP5FV2zec7nCn1A3rYJVu23pgPNEO4xzs=;
 b=lgf/IabRf5bx98Ocusv7agH24oluqgkGsqG7KzaPXXhJMnxXtWvAJgwKNlVEBTm96F
 9yC98WHq0l/AbGKSJ1mq43avX6AjR7I7IWu0csM/LYXnzDaNV9dBlo+VnCY+t4SmXQm6
 pmrPiu9sCiUsI/rad1d4Iu99qHmRw/DRSRlREnEPKj+G5OWTjbSBkmo2x6re8A0g5DMK
 kgNcqIPJn5pWgyhgG8ENoL+X0t9pwWuLJEF3/xecDEZRZ5Locsusd3m0Qppqk2R5R1kU
 NWafSQC0hDIcoWToqhd1+cOnBG7zqOtwqJiJlTwTaKKZqetCnmZ0VDZoEX8K1QnB9Ed6
 eB6w==
X-Gm-Message-State: AOAM533D1Tcvv30C8LFGjqK8mPj3paSBXh0z1gxB8JLa+gZNU56ihx1L
 06vruhmhixeW0tEDkFxlZwRpUzgs2iTjA6uePc1/GRoWjNqom62CzHTPTByoJa2QDvUSDVIm/i+
 jOMhtWpbmnwnrifTwrSVDb0RdMrmHa3Jc76uPpsJ4T55pyRrjVu7co7QWSwhG3IuB
X-Received: by 2002:a5d:4d0d:: with SMTP id z13mr30662099wrt.34.1628603633319; 
 Tue, 10 Aug 2021 06:53:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy1vbEkIddUVEdUGu6NSSa8g5/tO2d7eTb5OL9RNmAUqOCl6/t3ap0WNTLDgMaec2r78EWkQ==
X-Received: by 2002:a5d:4d0d:: with SMTP id z13mr30662075wrt.34.1628603633096; 
 Tue, 10 Aug 2021 06:53:53 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 l9sm9023239wrt.95.2021.08.10.06.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 06:53:52 -0700 (PDT)
Subject: Re: [PATCH v9 00/16] qemu_iotests: improve debugging options
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210809090114.64834-1-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <5d8db63d-6df4-98d8-7df9-d087210b907b@redhat.com>
Date: Tue, 10 Aug 2021 15:53:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210809090114.64834-1-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.08.21 11:00, Emanuele Giuseppe Esposito wrote:
> This series adds the option to attach gdbserver and valgrind
> to the QEMU binary running in qemu_iotests.
> It also allows to redirect QEMU binaries output of the python tests
> to the stdout, instead of a log file.
>
> Patches 1-9 introduce the -gdb option to both python and bash tests,
> 10-14 extend the already existing -valgrind flag to work also on
> python tests, and patch 15-16 introduces -p to enable logging to stdout.
>
> In particular, patches 1,6,8,11 focus on extending the QMP socket timers
> when using gdb/valgrind, otherwise the python tests will fail due to
> delays in the QMP responses.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
> v9:
> * Replace `! -z` with `-n` in bash scripts (patch 8), and quote $GDB_OPTIONS in
>    the same if condition [Max]
> * Add r-b from Max to all patches except 8, remove r-b from Vladimir on patch 8

Thanks!  Applied to my block-next branch for 6.2:

https://github.com/XanClic/qemu/commits/block-next

(Usually, I’d take test patches to the block branch regardless of where 
we are in the freeze, but with this quite long series I feel better 
putting it into block-next.)

Hanna


