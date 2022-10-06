Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0885F6DE9
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 21:07:51 +0200 (CEST)
Received: from localhost ([::1]:38838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogWDl-0003IZ-UP
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 15:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ogViA-0006I3-15
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:35:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ogVht-0003X1-Js
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:34:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665081291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SmAidqdAldfI0aYc9un6mpJ1AIzCeIflPCYxS25KLUg=;
 b=I21yDakT8lnxFUNf971sFtoGSK9xRnNzZZ6WWPy7naRfWdUJFzr1+Bjbn2/NC2irXhSL0e
 +Elt+VD8YMuTAu27i0opy3if3Bo4VNPgverWChAtjFPTBsC6D8rJqiOWscoLLW35p2RPNt
 EKGtUehVTzbnimCHw5dXB1w8WiWsHcM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-252-UB7vMGmMNgaxjXLVAW8LiA-1; Thu, 06 Oct 2022 14:34:50 -0400
X-MC-Unique: UB7vMGmMNgaxjXLVAW8LiA-1
Received: by mail-qk1-f200.google.com with SMTP id
 n13-20020a05620a294d00b006cf933c40feso2123233qkp.20
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 11:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SmAidqdAldfI0aYc9un6mpJ1AIzCeIflPCYxS25KLUg=;
 b=E8UOojStlAwLIvFQpy6Mf/zrhC3LO89GCeOpfyI6OJBwyabQINiWN6eLAo5r4wJKfP
 wwItpOFS9PkGAK5KRf95S7Zak5xRLCxrPbI2BqpUh9wykzS5O6zz+EmtzOAQllRbBkso
 KQJc3WZHLdXl820Lwd4BguADwcInfgy0S3RiRG2KMs4BOeWRwQY1Ach5ST4jjSARJVn7
 Lx0Vx3uLkxykygu0T+e1Ia8tvvh3zgki/Fmgs5VReC6vg+D8Q71Dl6VdI3omhZ2SuV1y
 3sNEFzR3U492KLk0HewXcQJaVGWqFXJHBZ9qUoxn5huP9SyI955g+sbVJGCv+i0ErhcS
 6fJA==
X-Gm-Message-State: ACrzQf1bgKm3RtS5RTd8yJWW+OhfdIKKPt4t4REOIxllZNf5CfxXTBTn
 /5T55wjpOUBDGrsDukxZ9l5qgtdd9ivOLD6sMbueBENZ1fg7MExiumBf3CTmiX4g35xVniHfZ46
 iiGcmS3XepnVdyBs=
X-Received: by 2002:ad4:596b:0:b0:4b1:ee66:1cb8 with SMTP id
 eq11-20020ad4596b000000b004b1ee661cb8mr1376076qvb.3.1665081289919; 
 Thu, 06 Oct 2022 11:34:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6wCMF0W6fb4SZ6IWp0/KDUcYqyN4+ODbqWnnJhenIT2Ajjz86frKRtC7HialLcqIgELkPDdA==
X-Received: by 2002:ad4:596b:0:b0:4b1:ee66:1cb8 with SMTP id
 eq11-20020ad4596b000000b004b1ee661cb8mr1376059qvb.3.1665081289718; 
 Thu, 06 Oct 2022 11:34:49 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 q19-20020a37f713000000b006bba46e5eeasm19151215qkj.37.2022.10.06.11.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 11:34:49 -0700 (PDT)
Date: Thu, 6 Oct 2022 14:34:47 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 11/14] migration: Move last_sent_block into
 PageSearchStatus
Message-ID: <Yz8fx2wO5f3gNPsJ@x1n>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225223.49052-1-peterx@redhat.com>
 <Yz8Jhyd6b5DscLxr@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yz8Jhyd6b5DscLxr@work-vm>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Oct 06, 2022 at 05:59:51PM +0100, Dr. David Alan Gilbert wrote:
> > @@ -2999,8 +3010,8 @@ void ram_postcopy_send_discard_bitmap(MigrationState *ms)
> >      migration_bitmap_sync(rs);
> >  
> >      /* Easiest way to make sure we don't resume in the middle of a host-page */
> > +    rs->pss[RAM_CHANNEL_PRECOPY].last_sent_block = NULL;
> 
> Why don't we reset the postcopy one here as well?

Because ram_postcopy_send_discard_bitmap() is only called before postcopy
starts, so the other field should be NULL already.  Thanks,

-- 
Peter Xu


