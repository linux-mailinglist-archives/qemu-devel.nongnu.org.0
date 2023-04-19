Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B97536E81EA
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 21:30:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppDUi-0007Mv-4V; Wed, 19 Apr 2023 15:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ppDUf-0007MW-6h
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 15:29:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ppDUd-0000ru-Ig
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 15:29:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681932566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xiDN6m2ENvPJokhivoTo1ycWEKK9I3MvJDFwfsWXLcs=;
 b=CtyC+mOWIKClrRAOTuC9OUuGLOA9KE3pQwQSehleiNj+8EzFOthwzuiQ4UloY6isI4Vmcn
 wtigAhvrH+SNT00aPDTBYtRey6qgqpXmILWLmAhNqSWQ0Ct4OqG6BE/f9o+ktPFA37d5HO
 xWLEf6fx3Zr8UzsfU/GoATCo42vXSVc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-InOGJVgxMweR_Ws00GnlLw-1; Wed, 19 Apr 2023 15:29:25 -0400
X-MC-Unique: InOGJVgxMweR_Ws00GnlLw-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-74e0a118257so3995585a.0
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 12:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681932565; x=1684524565;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xiDN6m2ENvPJokhivoTo1ycWEKK9I3MvJDFwfsWXLcs=;
 b=cGYVDuhlZKpxorHWOjwoqVWTX7o7xhVnTmkSpNPgqOys2jk3gYHE5CKB/K5fRCrbtL
 KRL6v2OLKfog+1Qe4fs5gyrolv3sZtP85GvCA3lI2nrIdnPAFJGoJedRY8LDkmLS49GX
 vGwVxw8sjdHEd4JWqMV1dfM5AOls0A+KQIxDlNE5eESv4IJhZj/69uv/rGxosy6G+OTX
 8/6AYOCWMoplulNc/wkv9/zmcbDxowxmOOujsSypyHQydaNraxiq5rMFVKyFvFwlKqi3
 t+UIyipKCmYWBHfwiAH51hTPwQ66rjhO2sGxk883LkuY+u2UK1VPU3YlGE2wU7xMChyb
 5fpQ==
X-Gm-Message-State: AAQBX9ciKtauNmit9TMqIYuF06WEGTGTqtst9b1n5yXefwQcVk/39Bs7
 tlHpc/ps3QsKKlcyCcufPBWamK2u/7/2v09xYKiCapruoFSKMRGvW5wgzqenBM96gsNbQlNj7LJ
 v7Fiom6GXogWQJZA=
X-Received: by 2002:a05:6214:3018:b0:5da:b965:1efe with SMTP id
 ke24-20020a056214301800b005dab9651efemr28522561qvb.4.1681932565152; 
 Wed, 19 Apr 2023 12:29:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350bxBx8cehsMA49Qzn0U8b9RGogD26AE/eKib4VpBW2GZpzsGLJe07C8pChoFmxiuT7GZlQnNA==
X-Received: by 2002:a05:6214:3018:b0:5da:b965:1efe with SMTP id
 ke24-20020a056214301800b005dab9651efemr28522531qvb.4.1681932564835; 
 Wed, 19 Apr 2023 12:29:24 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 pp26-20020a056214139a00b005dd8b934571sm4607187qvb.9.2023.04.19.12.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 12:29:23 -0700 (PDT)
Date: Wed, 19 Apr 2023 15:29:23 -0400
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v3 00/12] Migration: Make more ram_counters atomic
Message-ID: <ZEBBDlcGuVxOGQOt@x1n>
References: <20230419162415.16260-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230419162415.16260-1-quintela@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Wed, Apr 19, 2023 at 06:24:03PM +0200, Juan Quintela wrote:
> Juan Quintela (12):
>   migration: Merge ram_counters and ram_atomic_counters
>   migration: Update atomic stats out of the mutex
>   migration: Make multifd_bytes atomic
>   migration: Make dirty_sync_missed_zero_copy atomic
>   migration: Make precopy_bytes atomic
>   migration: Make downtime_bytes atomic
>   migration: Make dirty_sync_count atomic
>   migration: Make postcopy_requests atomic
>   migration: Make dirty_pages_rate atomic
>   migration: Make dirty_bytes_last_sync atomic
>   migration: Rename duplicate to zero_pages
>   migration: Rename normal to full_pages

Reviewed-by: Peter Xu <peterx@redhat.com>

One trivial comment on last patch: full_pages is slightly confusing to me,
probably because "normal" matches with the code (save_normal_page()),
meanwhile "full" makes me think of small/huge page where it can be a
huge/full page (comparing to a "partial" page).

I'd think "normal_pages" could be slightly better? No strong opinions
though.

-- 
Peter Xu


