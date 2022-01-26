Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A431049C4C2
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 08:53:29 +0100 (CET)
Received: from localhost ([::1]:44894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCd7Q-0004Dk-Mm
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 02:53:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nCcw8-0008TM-84
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 02:41:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nCcw4-0002Tq-TM
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 02:41:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643182903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g0+MBbbAcC1Az/HydVO8bypGmwx9pL77E+M7dOlyoAU=;
 b=c9tnswDG+g2nz3aPD6koJa8Xos4WaHfwFBrtrOLetHZXbPimVHxOfvBDZF95boGGW37JFY
 nKJTXgNKxIeDYYPVFPLZvgD08fN7TyWucwvp795eibA2mBjgxGUVoGKoDwSL5zQy1+/JhD
 mAB3bJA4jlE5r0U3hZRe1igvjxsL3eY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159--QfTyUjSOqu_HKZZTVJniA-1; Wed, 26 Jan 2022 02:41:40 -0500
X-MC-Unique: -QfTyUjSOqu_HKZZTVJniA-1
Received: by mail-wr1-f72.google.com with SMTP id
 k12-20020adfe3cc000000b001d6806dfde1so3909660wrm.16
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 23:41:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g0+MBbbAcC1Az/HydVO8bypGmwx9pL77E+M7dOlyoAU=;
 b=rQbXMhAkFgmzroLj7X67P4g2E4q6rhwoLt5o0xIK7ysnRhId57fKYeAEV/PZH7kr/v
 CwgVE6AIsPFA+94Otn51HGMP/GyCZ7jcIaJyB3kK9Rf+SxY8iQBKrEXxRcd0bfRYffmU
 4RF5kuknSNwwK2UH4HSCv/nramQsgs7HC9T2gpaQgR6aqLKZ44/OwT+1a05HJm+WJiKd
 dOWey3lieBro7J9zslfx9s4A9PyI9ZR71U+o7zVF1vd3+1SWqGARdCyRXydAhN3qK4+U
 c4InuHM1hA9whV7psLypv86wYlISUogx72Y0kbNoWkZcX500laiBSqYeVHn3MpR4gViw
 o5WQ==
X-Gm-Message-State: AOAM531Ao+sISRyoESfqq+6YWwc8QMwGMLosagm7RD9XFYLUAeteCFJW
 r9xL8CkgpLTHljUS8qdR0Rx7/UbKtCFhtD4nX1m7RGyrTgjpc1bLDqM3JctIaKr+hHG7EOTokd3
 j1lpRNVOpguHHE/0=
X-Received: by 2002:a05:6000:1861:: with SMTP id
 d1mr19855429wri.497.1643182899506; 
 Tue, 25 Jan 2022 23:41:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8dzjCVZjDcmpmRWb7gn38aq8PflCASxqI92Z+iPzxhHMS01na5YqhsGeleDhFGDPTpr+hLg==
X-Received: by 2002:a05:6000:1861:: with SMTP id
 d1mr19855404wri.497.1643182899282; 
 Tue, 25 Jan 2022 23:41:39 -0800 (PST)
Received: from redhat.com ([2.55.1.143])
 by smtp.gmail.com with ESMTPSA id b1sm2859742wrd.12.2022.01.25.23.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 23:41:38 -0800 (PST)
Date: Wed, 26 Jan 2022 02:41:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v13 06/10] ACPI ERST: build the ACPI ERST table
Message-ID: <20220126023940-mutt-send-email-mst@kernel.org>
References: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
 <1643044621-15892-7-git-send-email-eric.devolder@oracle.com>
 <alpine.DEB.2.22.394.2201251600060.1134355@anisinha-lenovo>
 <4c680569-bca2-c85b-b0e0-0cfbb5c158fc@oracle.com>
MIME-Version: 1.0
In-Reply-To: <4c680569-bca2-c85b-b0e0-0cfbb5c158fc@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, Ani Sinha <ani@anisinha.ca>,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 25, 2022 at 10:24:49AM -0600, Eric DeVolder wrote:
> And here is what the main snippet looks like with the above changes (a diff
> is quite messy):
> 
>     /*
>      * Macros for use with construction of the action instructions
>      */
> #define BUILD_READ_VALUE(width_in_bits) \
>     build_serialization_instruction_entry(table_instruction_data, \
>         action, INST_READ_REGISTER, 0, width_in_bits, \
>         bar0 + ERST_VALUE_OFFSET, 0)
> 
> #define BUILD_READ_VALUE_VALUE(width_in_bits, value) \
>     build_serialization_instruction_entry(table_instruction_data, \
>         action, INST_READ_REGISTER_VALUE, 0, width_in_bits, \
>         bar0 + ERST_VALUE_OFFSET, value)
> 
> #define BUILD_WRITE_REGISTER(width_in_bits, reg, value) \
>     build_serialization_instruction_entry(table_instruction_data, \
>         action, INST_WRITE_REGISTER, 0, width_in_bits, \
>         bar0 + reg, value)
> 
> #define BUILD_WRITE_REGISTER_VALUE(width_in_bits, reg, value) \
>     build_serialization_instruction_entry(table_instruction_data, \
>         action, INST_WRITE_REGISTER_VALUE, 0, width_in_bits, \
>         bar0 + reg, value)

Please, don't hide variable accesses in macros like that.
whatever is accessed should be part of a parameter.

-- 
MST


