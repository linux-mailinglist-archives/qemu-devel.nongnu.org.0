Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3221255207A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:22:03 +0200 (CEST)
Received: from localhost ([::1]:44366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3JE1-0000T5-3F
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3J5L-0006Xa-7R
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:13:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3J5J-000091-9g
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:13:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655737980;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jjp2iLbD7Sz7x1c+22pDG+YQi9/GrXLZe8oE39onNNU=;
 b=UqEl9etMQQvPp/48EbeXcF4a9ZI+lpRxRBNCW0iIHMA4V9/g16Z8TbUWTlyawLzx+IRi+O
 37czQpZrxiD4Nb/dSx1622jiz2nHZSLy1IsXmN8T1HLQk+dc81SJPkWDYewuS18xAX2wvm
 vA/SRJPfbRoy2CBhou8MTYA4YvpB25g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-G3m3GtK-N3ah5NCMQ1daag-1; Mon, 20 Jun 2022 11:12:59 -0400
X-MC-Unique: G3m3GtK-N3ah5NCMQ1daag-1
Received: by mail-wm1-f69.google.com with SMTP id
 o2-20020a05600c510200b0039747b0216fso7039630wms.0
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:12:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jjp2iLbD7Sz7x1c+22pDG+YQi9/GrXLZe8oE39onNNU=;
 b=D9lr8tUHKsdrrH0sMER4Moh3vWLuuUdHUY5621RlVNckKZqhUx4xz1FEf5Kbo/Rmf2
 J/fyv1VYHthu6y2d4PD6MMhUhN1ouNw1K9O+32VTeAtPtKWIl3B7vhl8tjWxDmYKEw2q
 qIgUJqBEjlsnZH2IeRVYkC4i+Q7lSyNmAIPj9ZCCJEtPI3a9gVgFRNqfoHOddqvYJ6lI
 stcTpcSQ2ypiu4jaj+Ld6LZhdfFeaBM/IL/Rs2JMp++hKNuSjTft4Db+WYp5hou4RAfu
 FwqKbSGhQ2D2oUlv4yqkW9z1uFGXh4uNUx0IIvxNHiABP1yut8P+6DvHGM0W85uyhS7z
 nGzQ==
X-Gm-Message-State: AJIora9NIefWwavSj+RhjPz2ymk2qGceKI5X//ObT5h+1KmLlCqIGg9N
 +sTPPRHLeKDm7owpRsHvk8NUcz/ehYHrSoUndIihDxz2cWxwCm5ktjxlfstZA9GvFmFLLhzXkmp
 HMmAAtX3Nw0rm52w=
X-Received: by 2002:adf:eb84:0:b0:21b:84dd:4d86 with SMTP id
 t4-20020adfeb84000000b0021b84dd4d86mr12676314wrn.288.1655737978249; 
 Mon, 20 Jun 2022 08:12:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vGKV70zcuzs/DUKmnVlcdLJ4pcTCgYLxnn9xz0EesIa5zAogc7CI+Z2tvBRa6rYJFGAqad8g==
X-Received: by 2002:adf:eb84:0:b0:21b:84dd:4d86 with SMTP id
 t4-20020adfeb84000000b0021b84dd4d86mr12676298wrn.288.1655737978074; 
 Mon, 20 Jun 2022 08:12:58 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 q7-20020adff947000000b0021b90d7b2c9sm2755487wrr.24.2022.06.20.08.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:12:57 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Hailiang
 Zhang <zhang.zhanghailiang@huawei.com>,  Fam Zheng <fam@euphon.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH v2 05/21] migration: rename 'pos' field in QEMUFile to
 'bytes_processed'
In-Reply-To: <20220620110205.1357829-6-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Mon, 20 Jun 2022 12:01:49
 +0100")
References: <20220620110205.1357829-1-berrange@redhat.com>
 <20220620110205.1357829-6-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 17:12:56 +0200
Message-ID: <87tu8f2wsn.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> The field name 'pos' gives the misleading impression that the QEMUFile
> objects are seekable. This is not the case, as in general we just
> have an opaque stream. The users of this method are only interested
> in the total bytes processed. This switches to a new name that
> reflects the intended usage.
>
> Every QIOChannel backed impl of QEMUFile is currently ignoring the
> 'pos' field.
>
> The only QEMUFile impl using 'pos' as an offset for I/O is the block
> device vmstate. A later patch is introducing a QIOChannel impl for the
> vmstate, and to handle this it is tracking a file offset itself
> internally to the QIOChannel impl. So when we later eliminate the
> QEMUFileOps callbacks later, the 'pos' field will no longer be used
> from any I/O read/write methods.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Thanks, I always wondered why it had that name, but never did the patch.


