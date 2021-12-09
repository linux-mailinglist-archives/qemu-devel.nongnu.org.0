Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC2246E05C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 02:47:06 +0100 (CET)
Received: from localhost ([::1]:60088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv8WX-0000e8-MB
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 20:47:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mv8US-0008IN-GR
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 20:44:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mv8UP-0003fT-04
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 20:44:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639014291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EZ/QQYlp+iyqYyf17joIwBRjXJWQtgJosT9BrjuvkZw=;
 b=iS2krCjVEE9HhGc91IXXg+RaN0noNdrjK5TcLFA5BNsGwbb5bu+7wkEacrFZIYQ9doSCRb
 KFvdkC8F5rwLhCsCz6FnQZhAOdXCNxMfMCCN0ShBcnSr6VPylNidygqh9rCtbDuZOHqcVe
 O0Duqstx5qy60W0RxhS+xiRfoZ1W4fI=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-cysrw33AOZqiJePY0-MESw-1; Wed, 08 Dec 2021 20:44:50 -0500
X-MC-Unique: cysrw33AOZqiJePY0-MESw-1
Received: by mail-pl1-f197.google.com with SMTP id
 e10-20020a17090301ca00b00141fbe2569dso1550579plh.14
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 17:44:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EZ/QQYlp+iyqYyf17joIwBRjXJWQtgJosT9BrjuvkZw=;
 b=fK1jeQ10ymF66reDHTYSBCne4nRXQKQ9ZP88Cxx6tsLsHnLO4OVlt4vnd6DfkM+ERy
 Z8UssHSbH+g76byysz01Apq7cz0v5Sd3dRHM7LHinUvK7pk+LvVJ23J99xI8vUWfMmMP
 OmeprLrZebQedBU1wOzJKJy3mtONlLtGAI02Qj2dejEYr8kC9tOpi/CuDmE/5OLRbN2H
 HTegSkwlakfcNGCUoeKMhSn6XDNcEN72zzsdakKbdoIl8w4Se07iKE7Ub/tLC6isOS9R
 5aHp6cP5B/X38yYa5fLjp/sDQJ8ZwRRMoLVi7hIGVqO2i4Uy+CqGcAUNqqEFcIvMRWTn
 E2+Q==
X-Gm-Message-State: AOAM532fPIiOF7s5mTuFVDDnHNrl7ZmtkDET7o+ig1Guch+lGpK2s0jf
 QPMQ4IeLiZwygoKioFTxsdkIzA6pWbyY/VkklCu/4AxZ5kN62Ik8AjxvImDN6uHYP694gYC9ryh
 3hLxKXjKm9iHTAKo=
X-Received: by 2002:a62:7b8e:0:b0:49f:a0ba:67ff with SMTP id
 w136-20020a627b8e000000b0049fa0ba67ffmr8854279pfc.64.1639014289144; 
 Wed, 08 Dec 2021 17:44:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2bVZGWLjXuwUS+WdloZBZUVPbKSYt5m4dnIhCdiIRh1N5dHEjVXKAIa9LZMGj1xayQ3igVA==
X-Received: by 2002:a62:7b8e:0:b0:49f:a0ba:67ff with SMTP id
 w136-20020a627b8e000000b0049fa0ba67ffmr8854260pfc.64.1639014288858; 
 Wed, 08 Dec 2021 17:44:48 -0800 (PST)
Received: from xz-m1.local ([191.101.132.71])
 by smtp.gmail.com with ESMTPSA id g17sm3589599pgh.46.2021.12.08.17.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 17:44:48 -0800 (PST)
Date: Thu, 9 Dec 2021 09:44:43 +0800
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 6/7] migration: Dump sub-cmd name in
 loadvm_process_command tp
Message-ID: <YbFfixNLlfvyj63Y@xz-m1.local>
References: <20211207115016.73195-1-peterx@redhat.com>
 <20211207115016.73195-7-peterx@redhat.com>
 <YbD8Uuscfd+bm2Ex@work-vm>
MIME-Version: 1.0
In-Reply-To: <YbD8Uuscfd+bm2Ex@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 08, 2021 at 06:41:22PM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > It'll be easier to read the name rather than index of sub-cmd when debugging.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  migration/savevm.c     | 2 +-
> >  migration/trace-events | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/migration/savevm.c b/migration/savevm.c
> > index d59e976d50..17b8e25e00 100644
> > --- a/migration/savevm.c
> > +++ b/migration/savevm.c
> > @@ -2271,7 +2271,7 @@ static int loadvm_process_command(QEMUFile *f)
> >          return qemu_file_get_error(f);
> >      }
> >  
> > -    trace_loadvm_process_command(cmd, len);
> > +    trace_loadvm_process_command(mig_cmd_args[cmd].name, len);
> >      if (cmd >= MIG_CMD_MAX || cmd == MIG_CMD_INVALID) {
> 
> No! you can't do that name lookup before the limit check.

Heh, right. :)

I guess it shouldn't matter in reality as we don't worry too much on untrusted
or uncompatible src qemu, but it's very reasonable to fix it.

Thanks!

-- 
Peter Xu


