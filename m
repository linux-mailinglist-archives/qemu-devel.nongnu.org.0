Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D19F6F4BFB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 23:19:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptxNs-00023W-6A; Tue, 02 May 2023 17:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ptxNn-000235-Fq
 for qemu-devel@nongnu.org; Tue, 02 May 2023 17:18:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ptxNj-0008K2-ON
 for qemu-devel@nongnu.org; Tue, 02 May 2023 17:17:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683062272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eTy5Iy3QlVjdYinxozbYMMT66kPJ2BCNJFSnfwmkgd8=;
 b=VJgZgWukMMT4fJOy9A9G07OGhRzQGIIuaEP2XkwZfHQEV095/EvIU3z/c4oUcOMQi1Lyrd
 HfjWxdzpu90WX9xoPElhfQlWJjlBglKQKXtlDjXe6gdLbVN1W/v5Dbuf8VYnBrPodnHr/k
 flUjVaKLexvLnoqCi8XTacj1d0JYaSM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-eXHVJmX-MTGqw3jS-nM8aw-1; Tue, 02 May 2023 17:17:51 -0400
X-MC-Unique: eXHVJmX-MTGqw3jS-nM8aw-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-5ef4d54d84cso11267116d6.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 14:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683062270; x=1685654270;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eTy5Iy3QlVjdYinxozbYMMT66kPJ2BCNJFSnfwmkgd8=;
 b=RbZ5+OxjFuBfq+KU6C4zVbK2fCB3ohN1gOrNIN2b7HurzvmCwpzqdPA4yc8qNXW8Ke
 MNZk/WLN1AMKS4ScBqmFjpYepXe1NVU5twMdnzuaZW1IAPAk6dhwF/PTFLf/PHXlvt/I
 J7GpalmFXgwZ1r876BnU6yJoCnj57W4V+qWq33o3j4flN7lh99JqjrWV/38XspPwQRWD
 tRlXcbAMqnyO/uyUo3Csezh9TPAMNDiVZDYj0pSnuGKQ10YAdt8nKKz/xmH9fARYgigH
 GErmL83BN4e9WEqy0jaRfwnnklqgRPWDnls/qXJXsFWTnRrYVvnf5KWLXlndKIbeL39s
 2yXw==
X-Gm-Message-State: AC+VfDwBQqD6qDlObG0Lnh3Qtstw+GcT1D6+BD86e0R6a4+dTc5eQ+Ec
 xJafyAh7d8VqbflRMt7FOdbu2NdqR5w6MSzivB+gdWlPbv8ge4DgCnYpg9KOUodHtOhoo0KGBmd
 iPqoRVO3g3PWJxghzzWqYGD0=
X-Received: by 2002:a05:6214:529b:b0:61b:7115:55a9 with SMTP id
 kj27-20020a056214529b00b0061b711555a9mr1740517qvb.0.1683062269935; 
 Tue, 02 May 2023 14:17:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5QF4rgYIrDvNyXRPzR0xMJzGgGU5+IQLBzsUxWLBjA4PL9Hcj3+rd1BtL559xcw0k+IAyt6Q==
X-Received: by 2002:a05:6214:529b:b0:61b:7115:55a9 with SMTP id
 kj27-20020a056214529b00b0061b711555a9mr1740491qvb.0.1683062269685; 
 Tue, 02 May 2023 14:17:49 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 y19-20020a05620a44d300b0074db94ed42fsm9963068qkp.116.2023.05.02.14.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 14:17:49 -0700 (PDT)
Date: Tue, 2 May 2023 17:17:48 -0400
From: Peter Xu <peterx@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com,
 Juan Quintela <quintela@redhat.com>, Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH] migration: Attempt disk reactivation in more failure
 scenarios
Message-ID: <ZFF9/DFGrF0pKgbK@x1n>
References: <20230502205212.134680-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230502205212.134680-1-eblake@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, May 02, 2023 at 03:52:12PM -0500, Eric Blake wrote:
> Commit fe904ea824 added a fail_inactivate label, which tries to
> reactivate disks on the source after a failure while s->state ==
> MIGRATION_STATUS_ACTIVE, but didn't actually use the label if
> qemu_savevm_state_complete_precopy() failed.  This failure to
> reactivate is also present in commit 6039dd5b1c (also covering the new
> s->state == MIGRATION_STATUS_DEVICE state) and 403d18ae (ensuring
> s->block_inactive is set more reliably).
> 
> Consolidate the two labels back into one - no matter HOW migration is
> failed, if there is any chance we can reach vm_start() after having
> attempted inactivation, it is essential that we have tried to restart
> disks before then.  This also makes the cleanup more like
> migrate_fd_cancel().
> 
> Suggested-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


