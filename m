Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF08D6EADF7
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 17:25:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppsc6-0006g1-JD; Fri, 21 Apr 2023 11:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ppsc4-0006fe-JN
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 11:23:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ppsc3-0004kB-4g
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 11:23:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682090628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/Et1/AgAW3Lwleuipa3RzmhVuUfD1vdkqDk7rIfUM7E=;
 b=WE7oVuXz2h9tY8PSJmyeSyNR8fE18Ec+8PTOCJ5sbXVSbssuvxdNzckdakTYrL0tNiOBrE
 ETSITI8sW9fdJR23Eug1XZZQyXfNpeNXRobr/147S79YPIM4SGYEccxWWQDeqRX/c3sBD5
 nZR/zeWpN6raiuvZ/vquaNwEjW7TFv4=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-oi4RGfswNzi_BNdN2EQdJg-1; Fri, 21 Apr 2023 11:23:46 -0400
X-MC-Unique: oi4RGfswNzi_BNdN2EQdJg-1
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-63b8e47fd94so445700b3a.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 08:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682090625; x=1684682625;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Et1/AgAW3Lwleuipa3RzmhVuUfD1vdkqDk7rIfUM7E=;
 b=lU3x2XEHZwmFHiNzDrF/ysHMGY1ZWmsRFA5e3LGFuIJxtDmjdhv9vPXHjufwy2/Ano
 i8wysMN/yLVP92Lugggw5cpTtARlZ/NlFEjjZp2HaHbk7B4XIAtFk1QGEqGm/EGiwr8y
 KXgVljbV5GZIGTWzVZurZ4s+hITDmfuQ3+W0QzcEABXNExP9EPugmZHlTPqDuu0VDyhG
 lywuiTpMRWtH3wsWxSXe7G8RrdX+9jm2fAZIrhs4k9rU4cxaJ0L8kGN8b6HKJ8/Uxr7u
 j5PPjYv9sVmiZldhQPMMgavVaI2auWdgumQgpbFIWL8pZ1Lw6tdB7jnqRv91mT6I7AOV
 SrCw==
X-Gm-Message-State: AAQBX9f5J8flZdsbyWGD8l03R8nrXMBuECMUCAgFgv8HtcNlHy0pUQXt
 lW9vp8ibT8XHNQeOsMhsNa1jGNa0qxJ9JrKdHd4OMitonhBgeoHOLrqGLJ11sG5FS+FOwXOs1mM
 b/H6p0LCZq7E+hS4=
X-Received: by 2002:a05:6a00:430b:b0:637:434a:75df with SMTP id
 cb11-20020a056a00430b00b00637434a75dfmr6052924pfb.0.1682090625057; 
 Fri, 21 Apr 2023 08:23:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350aU7rxDqsnU5wrrjEX2jh+EDIAuPEKQwXLF9Hi2gxHMl+LPepH7lKgcrx2jcuH1jhtXKzwnTg==
X-Received: by 2002:a05:6a00:430b:b0:637:434a:75df with SMTP id
 cb11-20020a056a00430b00b00637434a75dfmr6052900pfb.0.1682090624708; 
 Fri, 21 Apr 2023 08:23:44 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 m8-20020a654388000000b0051303d3e3c5sm2781355pgp.42.2023.04.21.08.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 08:23:44 -0700 (PDT)
Date: Fri, 21 Apr 2023 11:23:42 -0400
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Add Leonardo and Peter as reviewers
Message-ID: <ZEKqfusi5NhRzqxz@x1n>
References: <20230419162957.16696-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230419162957.16696-1-quintela@redhat.com>
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

On Wed, Apr 19, 2023 at 06:29:57PM +0200, Juan Quintela wrote:
> Now that David has stepped down with Migration maintainership,
> Leonardo and Peter has volunteer to review the migration patches.
> This way they got CC'd on every migration patch.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


