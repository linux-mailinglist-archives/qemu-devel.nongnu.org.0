Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2740839777C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 18:06:46 +0200 (CEST)
Received: from localhost ([::1]:42598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo6ui-0007AB-KH
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 12:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lo6tA-0004tc-5z
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 12:05:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lo6t6-0003hS-JB
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 12:05:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622563502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p2XsdAqx6HQDNBBYLTuBXyauNnrv701CMhoNsgSsWZo=;
 b=Szvixnfvl0XA5bM1EYHUA8yLOAUS1uzfdbwE+n/5XHBvZm4yNbb9LxH/UVsBHvG9wE2dOb
 Xan2p2tDM4eNfTfYuSA53vlDugOMGl1C4Sng3YOFYhU0RzOONMRqGtL7BMiqu2zADHRrdk
 BOrjsGrAMiOLvF1Q3aJ1+SrOQjaF3e0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-UXgBKQdNOquZ1pX9oigMfw-1; Tue, 01 Jun 2021 12:05:00 -0400
X-MC-Unique: UXgBKQdNOquZ1pX9oigMfw-1
Received: by mail-qv1-f71.google.com with SMTP id
 b24-20020a0cb3d80000b02901e78b82d74aso11886995qvf.20
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 09:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p2XsdAqx6HQDNBBYLTuBXyauNnrv701CMhoNsgSsWZo=;
 b=LzzTcJGkqe40uY7b/uagazWvi1O13I7JV/VtR9cQm5npEDubSfzn4YGmi75RQNhZwm
 qTI+WXQ+UKk5d0GVjUxVXWqgJvwFuDBpE4JlJi+l5xeOizT9gc9toLVVjvJF4GnD6q4C
 LsJ6BWIOIEaEj1+y7PZVLnILBYyk96QAq19mA2X+V2J0Sx3AXdzNtGk7ybk2KSYwHLpU
 akMtgVHVv+Rc4zFPGmO3sa23p6Sy2E29yYwC2SblT+n2unzVti4Y/JSEmqhPuFz8kn9y
 9Hq0agNrZuvwM7lQSMT4NiphtRzjoAxLgF2zXebRlXHbBJKuM6U0yOREra4+04OFuykR
 QUoQ==
X-Gm-Message-State: AOAM531FTMszm9d9G+hffn7I2PR2AJTRqJnpuJez7BOXIpbaxJfnNQbx
 lfzgWkIVkvvp7aVc21lpBw9xvki5LdY0uhTQa6TiiVYgVVHsY0A6+VqVnBTXvsLWinSJerjoXGc
 5AnX3ojDv/LOHwOs=
X-Received: by 2002:ad4:584b:: with SMTP id de11mr23234987qvb.53.1622563500394; 
 Tue, 01 Jun 2021 09:05:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUOR6mKyddQ6PFum0nAHuEsHeICW4XYG1cZ6VAiL9WuMFWQEe+nVMkrW6nwkDmmupnWsVnvA==
X-Received: by 2002:ad4:584b:: with SMTP id de11mr23234968qvb.53.1622563500182; 
 Tue, 01 Jun 2021 09:05:00 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-61-184-147-118-108.dsl.bell.ca. [184.147.118.108])
 by smtp.gmail.com with ESMTPSA id p19sm11371140qki.119.2021.06.01.09.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 09:04:59 -0700 (PDT)
Date: Tue, 1 Jun 2021 12:04:57 -0400
From: Peter Xu <peterx@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: Re: [PATCH v3 1/1] yank: Unregister function when using TLS migration
Message-ID: <YLZaqcGG6QcZbbkA@t490s>
References: <20210601054030.1153249-1-leobras.c@gmail.com>
 <YLZJME3kiFe0rMRe@t490s> <20210601173233.3a742bd8@gecko.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20210601173233.3a742bd8@gecko.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras.c@gmail.com>,
 berrange@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 01, 2021 at 05:32:33PM +0200, Lukas Straub wrote:
> > I have one pure question not directly related to Leo's patch (probably for
> > Lukas?): we check OBJECT(ioc)->ref == 1 when unregister each function.  In what
> > case will the ref be not one?
> > 
> 
> If a return path is opened with qemu_file_get_return_path(), it will
> take additional references:
> 
> qemu_file_get_return_path() (qemu-file.c)
>  f->ops->get_return_path() -> channel_get_input_return_path() (qemu-file-channel.c)
>   qemu_fopen_channel_input() (qemu-file-channel.c)
>    object_ref(OBJECT(ioc))

Makes sense.

Wondering whether it's better to unregister in migrate_fd_cleanup() rather than
channel_close(), as we used to register in migration code rather than in qemu
file wrapper layer.  I feel like we can drop the ref==1 check if we move, as
the return path should have been closed when reaching migrate_fd_cleanup()
(similar doubt to multifd_load_cleanup() calls to yank_unregister_function()).
No strong opinion, though..

Thanks,

-- 
Peter Xu


