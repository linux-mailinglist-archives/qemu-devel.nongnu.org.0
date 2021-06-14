Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F833A6E74
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 20:57:04 +0200 (CEST)
Received: from localhost ([::1]:39188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsrlf-0004dC-Ux
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 14:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lsrjJ-0002D0-Qz
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 14:54:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lsrjF-0006Ih-8x
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 14:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623696870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DPVJwum5D/41Q0m+SZq1QpWTRkkb9lUxFIfPUsn0KjU=;
 b=D3E62ed3GsDSOKKRQs909EIPQJWTYOaTBy8XZEl+YTBtYjU5Ioygx0KI104qV7iQGFZqAt
 AUI1Lmt9FH/CK81LIbwewhDG7UURK6jKh/MtMxJs6Sg5EFXIlTnWa+yGdqEMPPIlY/LiBT
 qhK3VOsYMxXe1O4dIK9jqwEMVpcE0Gw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-rMxe3OmhPs2LupE9dbEetw-1; Mon, 14 Jun 2021 14:54:29 -0400
X-MC-Unique: rMxe3OmhPs2LupE9dbEetw-1
Received: by mail-qk1-f198.google.com with SMTP id
 t131-20020a37aa890000b02903a9f6c1e8bfso23985367qke.10
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 11:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DPVJwum5D/41Q0m+SZq1QpWTRkkb9lUxFIfPUsn0KjU=;
 b=SRwSI0VCFjBPx6AdcAOjg4dc93fNwy02ZELQl8pTXjkM9EnHkNbLBit4VemlP2U/3B
 IS3Ds6L03jXpCKR9gpOslkKKjOcGmHih7iXas35eDY/LOA54ElI+1f43u8sUA5Q2lNEA
 6iTiYxIZOJqKLVlABmA70yJlkjzw8plEKYD2xmfhRBCAHCpbqTcgEjoi064UBwepPPd9
 x+H6jdnFxRQrNwasPwDlQwiBMauflp38VoL0tv+ow9zTPzdQChKzfhByatnpG2ysOghB
 CZLDbMM3FQgFZEmKuxTSbXnVfgjUm7ygPvh1U5Revwa3Ql9NM0jygKc4OpXhY7hBpCA6
 +3BA==
X-Gm-Message-State: AOAM531xlJrruaQBwj4Mh8TbDeQUZtaaYHyXKKBjlH6XjjnbME/hJZSB
 LfF0FC19CXz6TxnJvn2DXhUAfyKfjSEZplF8tuKt+3ex3umN7DbCRRFeuMdZVH54tMSMET3yiQY
 EN2feyPEYfPdZ8zc=
X-Received: by 2002:ac8:7956:: with SMTP id r22mr17080902qtt.267.1623696868962; 
 Mon, 14 Jun 2021 11:54:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzq6lt+X/eNgqr7p91SSDKLeGkd2i69wPKNpT6NmYaXZMh2Fl//gfnqzAiQgkj9BPh8j2AHjg==
X-Received: by 2002:ac8:7956:: with SMTP id r22mr17080886qtt.267.1623696868784; 
 Mon, 14 Jun 2021 11:54:28 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id k7sm10808042qke.65.2021.06.14.11.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 11:54:28 -0700 (PDT)
Date: Mon, 14 Jun 2021 14:54:27 -0400
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v2] hmp: Add "calc_dirty_rate" and "info dirty_rate" cmds
Message-ID: <YMel4z/Lb9Y5LCFV@t490s>
References: <20210601141805.206582-1-peterx@redhat.com>
 <875yyggzrk.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <875yyggzrk.fsf@secure.mitica>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Chuan Zheng <zhengchuan@huawei.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, huangy81@chinatelecom.cn,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 14, 2021 at 06:46:39PM +0200, Juan Quintela wrote:
> Peter Xu <peterx@redhat.com> wrote:
> > These two commands are missing when adding the QMP sister commands.  Add them,
> > so developers can play with them easier.
> >
> > Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Cc: Juan Quintela <quintela@redhat.com>
> > Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
> > Cc: Chuan Zheng <zhengchuan@huawei.com>
> > Cc: huangy81@chinatelecom.cn
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> > v2:
> > - rebase to "migration/dirtyrate: make sample page count configurable"
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>

It turns out this patch has landed upstream already. :-) but still thanks for
the review (and welcome back)!

-- 
Peter Xu


