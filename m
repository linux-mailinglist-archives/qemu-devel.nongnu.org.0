Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAB75252C1
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 18:39:28 +0200 (CEST)
Received: from localhost ([::1]:44916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npBqZ-0001WJ-ER
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 12:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1npBnd-0008Ho-Hl
 for qemu-devel@nongnu.org; Thu, 12 May 2022 12:36:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1npBna-00053h-JT
 for qemu-devel@nongnu.org; Thu, 12 May 2022 12:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652373381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rzE9Kzj4LjnJzhED/mAD4jj0GqqGhQVFC8so0SFmoOs=;
 b=HajmX63oJuE43wn8s2ZB/1QiHSvqm+7jBkEIPK74pl8n7bLsgwXvA/Fmg4vX71zdVsVAP3
 KA9MFcpIhsuT1NCXvctKQ1mrbUxgwzv/U7zLwLVIvD7FaF8BOWmNe1MYuJPpoTPvjnBlVk
 h8HNpch9wQAqEwZcQGzFA2vSM8HXO/0=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-0IiXqe6jNAWK_q1Kp_jC2g-1; Thu, 12 May 2022 12:36:20 -0400
X-MC-Unique: 0IiXqe6jNAWK_q1Kp_jC2g-1
Received: by mail-il1-f199.google.com with SMTP id
 i15-20020a056e0212cf00b002cf3463ed24so3619576ilm.0
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 09:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rzE9Kzj4LjnJzhED/mAD4jj0GqqGhQVFC8so0SFmoOs=;
 b=rO/FDGJHkD0u88P1lbIpAC+fc724wTRe56gzdtC5/qj8Nf4Z/4lZiVnQvlMqZ3Xy3r
 kNorx8wJcxRQ9ELDe0I5lHFkXXvDxICmzPfZ8euooXHD6epLlZyXx1M9n/W1hmnaFvav
 Q9SeSXTu7zN56PCSKBSloLpWDqZ4NKgwoRsgQxFkS8HIdnAZy+kmIxdvCrsDBi0cNRH2
 BEgXnytHGm9YGb2Ix3Nwt9LwNiA/43AUXlPW2DIBHJhs0K+RGqXR18r0cwtN0UQ6SEE+
 a3gqbLPEcC7U6rZlwWZWuR3X3m87MlwwY3SNaO74ONi4fsz458Ws0vrl39zPeyJcgEE3
 6Giw==
X-Gm-Message-State: AOAM532mO9JhXScGCvmxdf1mGq1cTRfIcFhqlgr3F95RtQ8FzsPyxAT+
 HLwhOkdoRYEnwWrd24B6XfnXaDVio86uiJKkzU7cXN7RYgHMCfemn4Vjbvo4eiwWp3wtYKf6H5z
 rYHLOxV9RQBG3LPk=
X-Received: by 2002:a05:6e02:170d:b0:2cf:b51b:c934 with SMTP id
 u13-20020a056e02170d00b002cfb51bc934mr429951ill.285.1652373379277; 
 Thu, 12 May 2022 09:36:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJqhGsLXR/ETarSJlfsquWX7TrF6UMM5hHu+VOSO+EhY/0gYwHpVDPi+Bt6H5DsQ/irNxX3g==
X-Received: by 2002:a05:6e02:170d:b0:2cf:b51b:c934 with SMTP id
 u13-20020a056e02170d00b002cfb51bc934mr429937ill.285.1652373379104; 
 Thu, 12 May 2022 09:36:19 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 e3-20020a0566380cc300b0032b3a781743sm4919jak.7.2022.05.12.09.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 09:36:18 -0700 (PDT)
Date: Thu, 12 May 2022 12:36:17 -0400
From: Peter Xu <peterx@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v5 11/21] migration: Postcopy preemption preparation on
 channel creation
Message-ID: <Yn03ge5v8SSX+zyk@xz-m1.local>
References: <20220425233847.10393-1-peterx@redhat.com>
 <20220425233847.10393-12-peterx@redhat.com>
 <d1bb73d6-ed34-f15c-f56d-407cdb571c08@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d1bb73d6-ed34-f15c-f56d-407cdb571c08@nutanix.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 11, 2022 at 10:38:00PM +0530, manish.mishra wrote:
> LGTM

Manish,

Do you mean you reviewed the patch?  Do you want me to attach this as a
Reviewed-By tag in my next post?

It'll be great if you can provide it by replying with the R-b tag.  I can
also attach it after your confirmation.

Thanks,

-- 
Peter Xu


