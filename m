Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A305438CE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 18:24:38 +0200 (CEST)
Received: from localhost ([::1]:35724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyyU1-0002f4-DU
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 12:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nyyMs-0002Vx-4C
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:17:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nyyMp-0002vh-Ck
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:17:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654705029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4U/utzCymJxYacHZjSCr+CiYl3dZLnrV0APSMWP4lBI=;
 b=LL0IcQg17yYY0T3vu58YwuRy7o539DkrLwhEjeptnlMXd6X+9a9OghhJjoeXOvEWTtN4an
 c6/UPNyRItpZAMxtqA2AQTvmPsw0KlRUCwNrCfiJeYHmep4p9lYhv2RUX4kpHnyMeJbMFq
 xlwcEbWq4NfuECfypLW8qSpG2o9UALs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-RQn6v77vO96JpvIEAIB_nQ-1; Wed, 08 Jun 2022 12:17:08 -0400
X-MC-Unique: RQn6v77vO96JpvIEAIB_nQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 o18-20020a5d4a92000000b00213b4eebc25so4340537wrq.21
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 09:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4U/utzCymJxYacHZjSCr+CiYl3dZLnrV0APSMWP4lBI=;
 b=r1GycB4RaSm6qoQ/+Rcl5e/d1bCffNNIB4l2yIJhtyVzzk5dJmzO1SL7P3g72fZKlp
 WGhGqQ+H847lfsDj70Z2hTR82sjoNAsP/RpDtPTTc4FgmDuHFJbstv49MRIY+c7isCgc
 3cIqaWnJ0D2JoFAZ6Xp0OZ9xkjXqIzY3IPj+pb4WbF2OjPWI7tceqDeEMdnQhpyya3A4
 GsKYifocekRFWjnC1ccymkPEbVF9Rr2Vp2Mv79FizmzsRmZ8VMNOerqkS5i3qMyA7DlW
 GuExAn2Cs5WSceZu5aoO2jNak6d373IcERropumwdpmZnfWYxw8i2hyVqUOngoX/6Bdq
 xcOg==
X-Gm-Message-State: AOAM533H2oTZeUYraVnQGKqd8V2GIDDyFXlzWge/KJYeEIHVHUeqhSRF
 5BcwoW3vRkmHv3D0k8mKmcGW0w0gbHBslfPbakuLBBSJKGxZbLteSxqPYB9+H5l3ohLmzoo/I7q
 JJzRSwJFJRHTsqXA=
X-Received: by 2002:adf:fb0c:0:b0:215:6216:6ed2 with SMTP id
 c12-20020adffb0c000000b0021562166ed2mr26951575wrr.450.1654705027447; 
 Wed, 08 Jun 2022 09:17:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylIswfa1Y9tedQlDiW//BwGsiegIqHyI27BrmDUamz/GK03JlBNvpbUR9kRbW9lNQktDF6aQ==
X-Received: by 2002:adf:fb0c:0:b0:215:6216:6ed2 with SMTP id
 c12-20020adffb0c000000b0021562166ed2mr26951558wrr.450.1654705027259; 
 Wed, 08 Jun 2022 09:17:07 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 u12-20020adfdb8c000000b002119c1a03e4sm20710181wri.31.2022.06.08.09.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 09:17:06 -0700 (PDT)
Date: Wed, 8 Jun 2022 17:17:04 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com,
 Mark Kanda <mark.kanda@oracle.com>
Subject: Re: [PATCH v5 02/10] kvm: Support for querying fd-based stats
Message-ID: <YqDLgDVs2tFYfZC5@work-vm>
References: <20220530150714.756954-1-pbonzini@redhat.com>
 <20220530150714.756954-3-pbonzini@redhat.com>
 <Yp+ObQxOi/EXc6PZ@work-vm>
 <758db6b4-5786-adf4-d293-d8dc7793a21b@redhat.com>
 <YqC3pocwSjcp2y/3@work-vm>
 <686d6426-f035-4218-25a2-c212af38ce58@redhat.com>
 <YqDH6Ec/6937BTT/@work-vm>
 <68b6f1bf-1425-90ac-3bec-103225c405e7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68b6f1bf-1425-90ac-3bec-103225c405e7@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

* Paolo Bonzini (pbonzini@redhat.com) wrote:
> On 6/8/22 18:01, Dr. David Alan Gilbert wrote:
> > 'Find descriptors for 'target', either that have already been read or
> >   query 'stats_fd' to read them from kvm'
> 
> /*
>  * Return the descriptors for 'target', that either have already been
>  * read or are retrieved from 'stats_fd'.
>  */


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> Paolo
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


