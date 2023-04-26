Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4BE6EF876
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 18:31:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pri24-0000ee-EC; Wed, 26 Apr 2023 12:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pri21-0000eL-Q5
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:30:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pri20-0007es-9a
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:30:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682526611;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=R1rxOTcjGo2/M6P0B6hGRXJT3GfGobaKhmxqyGQhZ9Y=;
 b=comuIATu3psIKjfoW7ltk+vEVOi3LlAuTb8JWDRljJdK+lQ0UxKt31LLp/UWY6IlKRrX1s
 TB5WhNLXIDYFDK/2h58UHo0ROjXcjer6jhwPW7pL2DsLBMdA5DHFqc/w5ZFPo9I7rDV0h9
 6Zerl3J/MMqWLCGM593WuGG/L/BW46Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-oKfisocVPcqxgIt8Aw_fYQ-1; Wed, 26 Apr 2023 12:30:09 -0400
X-MC-Unique: oKfisocVPcqxgIt8Aw_fYQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-2ffee43dac5so2708471f8f.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 09:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682526607; x=1685118607;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R1rxOTcjGo2/M6P0B6hGRXJT3GfGobaKhmxqyGQhZ9Y=;
 b=YTIEGNtA8FcpIAWou2J3atvAP6uCLIEKNc24/5lqbtENaM4EPILTnDeRieHl9xD3mG
 fgnrpIxECYH8VnQaujWnTopJAboxUTvpnD+yabTj3VhcQ3++FvIQCP6ORM2ySEOjBxBs
 dM8z/WYSrOVztN+M776+jjK/9TGqipc2kfCfcPiohjX3MAvaA6agGx48sZifIUdUueUh
 BXbWiFS5ThIXY4UjAcGrq+YtCmNxdhkkD5akM/25lfqOVI/VW3vkjA6s3iXTzNbpKdjQ
 RaukP6GMwQeYP9MQS1FWfre7Gf6ylfVXnRG0yrMuetBCc9rkgWBpK7vqV9Wg0m57+vVW
 DcZg==
X-Gm-Message-State: AAQBX9f3Drkq4DhC0un6pmJD0J2fRt1tu46Wz8zj9A8IwKJj1MQB8cZh
 Zy/Yn7vZyaYXWWORFhPxLPpSQNPMlYxd0Vj7AT9I5IISLc4+PQcP3Hn4g3nrd1U/rb5jinwesGX
 tkuW0TzjDNYWl0N5RLq0mlXRUlwlh
X-Received: by 2002:a5d:6886:0:b0:2f0:6192:92db with SMTP id
 h6-20020a5d6886000000b002f0619292dbmr13467003wru.46.1682526607721; 
 Wed, 26 Apr 2023 09:30:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350azmS6ABNTAp89Q47IizRW6ltBkgLhnJ8xpMxNbVsucYGXz7uVW2RXtwO4NnOWi/3Mps7Upgg==
X-Received: by 2002:a5d:6886:0:b0:2f0:6192:92db with SMTP id
 h6-20020a5d6886000000b002f0619292dbmr13466992wru.46.1682526607391; 
 Wed, 26 Apr 2023 09:30:07 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 g16-20020a5d5410000000b002fbc61cd080sm16384376wrv.9.2023.04.26.09.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 09:30:06 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PATCH 1/2] migration/vmstate-dump: Dump array size too as "num"
In-Reply-To: <20230425180544.1815888-2-peterx@redhat.com> (Peter Xu's message
 of "Tue, 25 Apr 2023 14:05:43 -0400")
References: <20230425180544.1815888-1-peterx@redhat.com>
 <20230425180544.1815888-2-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 26 Apr 2023 18:30:05 +0200
Message-ID: <87bkjafvxu.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> For VMS_ARRAY typed vmsd fields, also dump the number of entries in the
> array in -vmstate-dump.
>
> Without such information, vmstate static checker can report false negatives
> of incompatible vmsd on VMS_ARRAY typed fields, when the src/dst do not
> have the same type of array defined.  It's because in the checker we only
> check against size of fields within a VMSD field.
>
> One example: e1000e used to have a field defined as a boolean array with 5
> entries, then removed it and replaced it with UNUSED (in 31e3f318c8b535):
>
> -        VMSTATE_BOOL_ARRAY(core.eitr_intr_pending, E1000EState,
> -                           E1000E_MSIX_VEC_NUM),
> +        VMSTATE_UNUSED(E1000E_MSIX_VEC_NUM),
>
> It's a legal replacement but vmstate static checker is not happy with it,
> because it checks only against the "size" field between the two
> fields (here one is BOOL_ARRAY, the other is UNUSED):
>
> For BOOL_ARRAY:
>
>       {
>         "field": "core.eitr_intr_pending",
>         "version_id": 0,
>         "field_exists": false,
>         "size": 1
>       },
>
> For UNUSED:
>
>       {
>         "field": "unused",
>         "version_id": 0,
>         "field_exists": false,
>         "size": 5
>       },
>
> It's not the script to blame because there's just not enough information
> dumped to show the total size of the entry for an array.  Add it.
>
> Note that this will not break old vmstate checker because the field will
> just be ignored.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


