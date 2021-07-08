Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CD63C19DA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:33:31 +0200 (CEST)
Received: from localhost ([::1]:58332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Zm6-0005jz-Pf
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1ZT9-0003Ux-Q0
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:13:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1ZT8-0006PL-0U
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:13:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625771633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e/OemIyWLZXGjWEzw2vFQ7XbNTFoFpRp9nwdPHN2io4=;
 b=ZVnGWn7d2SEf9idXz06iZx1/dDqdXyQRrATt+nSMNAP6GRFWCrPFDYZ6fGyBZBuquOcYKK
 ztZyf6nVMsgKshejxUI8QuADtDXjZ7AJ3zMWwxG2Szdee3yQmcd5vtt3Y0R7hxiAuObRKb
 R0hhtYa143rO6WY1LsVvqe3ehsTMQYk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-rRInyZz-PViMjFvFE-qarQ-1; Thu, 08 Jul 2021 15:13:52 -0400
X-MC-Unique: rRInyZz-PViMjFvFE-qarQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 bk10-20020a05621406eab02902d1aac9c421so3726908qvb.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e/OemIyWLZXGjWEzw2vFQ7XbNTFoFpRp9nwdPHN2io4=;
 b=W+fuKrU/8Cyh+L3DghxgWmFxI+f3O6/2OXTH6jL5O8gQP0QxVIYNNx0aomaUQjkJXh
 VhVINuEvbDy218U+k2zJQmWy2nYrmE6Wq7yvvuzEolvFo7VeMA+BbQ/Z4x4iPpLD2k96
 49iCWD7RLw9W13eZiHsrhp//tFOqoBABFUD0LWcdhzo5KrNNWDEk4Cqn55MqBfsTIx+9
 54+v4+uLri3rjCGFL2zBFneH3FRdJ17tRzbw6sC1x5S6ZFjBmXjiOTYvs9j+wFs1oWfL
 2fSWjpGb2RiNRQlrxEjghO3k0tkaGWqZsn7EFLDHRINNRQfVDLQMBHtQUwGpo11rObNa
 WGeQ==
X-Gm-Message-State: AOAM532pIauzlvhpGD4TOOsLj94+cze65LZRMohFk9wNQNFXPiEwmuoY
 Q0xKi1oipVmoGOzVoN9mAo2yj6JKokNUK4Y24O85yT5izbTaSJJIBmR49du7BqEFEKCiOEscR3F
 O4m/I6JocDKQCzamc0MDqJ2GfkEAVZkXQoq+EQxhlU2b22jL14OUr16ptCEoHWJuR
X-Received: by 2002:a37:e4f:: with SMTP id 76mr10687812qko.474.1625771631725; 
 Thu, 08 Jul 2021 12:13:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKi7len9K9eypueniefoYQ2Eu29vu2DQSPrb6on3W6ka+XvMEjekkE9UEvikEnGQKi+c3gKQ==
X-Received: by 2002:a37:e4f:: with SMTP id 76mr10687788qko.474.1625771631484; 
 Thu, 08 Jul 2021 12:13:51 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id j19sm1087479qtp.43.2021.07.08.12.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:13:51 -0700 (PDT)
Date: Thu, 8 Jul 2021 15:13:49 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 1/3] migration: Release return path early for paused
 postcopy
Message-ID: <YOdObQz8twcmY/TP@t490s>
References: <20210708190653.252961-1-peterx@redhat.com>
 <20210708190653.252961-2-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210708190653.252961-2-peterx@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Lukas Straub <lukasstraub2@web.de>, Juan Quintela <quintela@redhat.com>,
 Li Xiaohui <xiaohli@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Li Xiaohui <xiaohuixiaohli@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 08, 2021 at 03:06:51PM -0400, Peter Xu wrote:
> Reported-by: Li Xiaohui <xiaohuixiaohli@redhat.com>
                           ^^^^^^^^^^^^^^^^^^^^^^^^^
I don't know how did I messed this up.. but it should be <xiaohli@redhat.com>

-- 
Peter Xu


