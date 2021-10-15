Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DCE42E630
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 03:36:20 +0200 (CEST)
Received: from localhost ([::1]:41850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbC8x-0004Qs-9C
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 21:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mbC7K-0003Df-MC
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 21:34:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mbC7J-0004SQ-48
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 21:34:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634261675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vbNXYOe/rje81bUvziOjI0qi/M9552rqUEflfHBT7iw=;
 b=CYzVARUY6ViQLL7yB7SJZ4GZRT83CCY1VRwoviDlWZDBEOBsxno37G5bEf/JYtJIBIdgjr
 lhPcMJ76yT8J0iZQZei8U6xM/FYvNKxDTZ1NYVFKyc790hTWFRjM7Ov1FEr7W3Y0heHHkj
 hv/fOBu1YUYaHFXidZ2r3jpqVxuKlZI=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-bnh8wrLLMcygR_UV72AcDA-1; Thu, 14 Oct 2021 21:34:34 -0400
X-MC-Unique: bnh8wrLLMcygR_UV72AcDA-1
Received: by mail-pl1-f200.google.com with SMTP id
 e6-20020a170902ed8600b0013f165d1b51so1810243plj.15
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 18:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vbNXYOe/rje81bUvziOjI0qi/M9552rqUEflfHBT7iw=;
 b=T43oaPfZvAF1WRMGsxrAXPIDMtC5OJ16Pr5X+AI0/1KpgLE24kjzb6A3dslzeFRGox
 BgzDitFTGbeiYPapYUUrPTFQF1zpUCbOmE/pnPLmvypCDFjbfak4t27y4XyR5XDOUtvz
 5AkH3Z27cjtdY28TXD4wH6wccySTTHm0mz8B/CgB3BbOJi0zg78dZTWe8QIZfeETH/dx
 M+MoPmGF1XnJXNF7KLe1hEdld0qe/XgkLGsrNSU37woU3pZTe6Nhm0fMMeFR28clJ0kB
 koNyVALS4gAZHWXEStp/7UI9Oazjmf2vi2B6IbHESZEtepkPv0622I4nN7m+JqbrZY5t
 5EHg==
X-Gm-Message-State: AOAM532FgP9idt6zhlmv4b32VMWs4054yBIxvEttQpY6vBLGKcQ9vpbI
 lvfjblq1zAq9lgRGIsMiDwstSkG742inUA7mvhP2Mrbt/CJDkHHFDmVHtaZtq1LKcsgVDe99QJT
 whpDYVTcuxYSmhIbcV4hioBlZ//QWIo/mDdmXK25Sf2drU4sXTxFSbxcc4DddzAVJ
X-Received: by 2002:a63:2a92:: with SMTP id q140mr6950423pgq.412.1634261673234; 
 Thu, 14 Oct 2021 18:34:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpeYqFqpWejQMpO667+WoQgqkLcYv9TxebfPDydjSuX/nv17gr5poksvq5Z9Pbkw89HRqvGA==
X-Received: by 2002:a63:2a92:: with SMTP id q140mr6950396pgq.412.1634261672853; 
 Thu, 14 Oct 2021 18:34:32 -0700 (PDT)
Received: from t490s ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id f33sm9836723pjk.42.2021.10.14.18.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 18:34:32 -0700 (PDT)
Date: Fri, 15 Oct 2021 09:34:26 +0800
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 0/3] dump-guest-memory: Add blocker for migration
Message-ID: <YWjaotHIJNEp92rp@t490s>
References: <20210922162009.125622-1-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210922162009.125622-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 22, 2021 at 12:20:06PM -0400, Peter Xu wrote:
> v3:
> - Patch 3: in qmp_dump_guest_memory(), keeps the RUN_STATE_INMIGRATE check
>   [Marc-Andre]

Ping - More comments?

If to go, should this go via dump or migration?  I think it belongs more to
migration more (and I got Marc-Andre's ack on all patches).. but leaving that
to maintainers.

Thanks,

-- 
Peter Xu


