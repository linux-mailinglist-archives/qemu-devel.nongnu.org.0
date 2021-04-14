Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A91935FD71
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 23:51:44 +0200 (CEST)
Received: from localhost ([::1]:46958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWnQF-0005xI-BI
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 17:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lWnNw-00057M-Hg
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 17:49:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lWnNv-0008Vw-1X
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 17:49:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618436957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to; 
 bh=FeOCQVYs9VH7gtCW2e7DNdTrJ70bQ6EaMUbthJDxVxw=;
 b=FuEWvpOG5wcWDDcE/s4Rp2nhM3lTomFfa40upvuQYq01ATu7kMBvr9BhyIXzbRsLesYwPy
 rmPxugc6dajBcUJTEXDy4ogBEJsyCu12+1JyUW1aotFlUWiaGBju3UvSRnZJaYNW4J2wsg
 0yP6t0e6MQS51Hw/QRIUs9SK/oLahmg=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-n_XnqvjXPLKp0IgdNB2a0w-1; Wed, 14 Apr 2021 17:49:16 -0400
X-MC-Unique: n_XnqvjXPLKp0IgdNB2a0w-1
Received: by mail-oo1-f72.google.com with SMTP id
 j9-20020a4ac5490000b02901e5eccc099dso45720ooq.11
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 14:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding:to:cc
 :subject:from:date:message-id:in-reply-to;
 bh=FeOCQVYs9VH7gtCW2e7DNdTrJ70bQ6EaMUbthJDxVxw=;
 b=Ux8ySDwd4AmhXfwT58/pxMpSZkLXiksI3YkCTQSIPgd2ORRcNrYyn0ZotwOY/ZgVmB
 +6FTnbHIqVFfZd+hKXFpT3r13eBenPpdVv1b5ydNkhJyevkH9yAzuia4e9HDAz186iDW
 QrZXDrg+1LTk3+lG8TvHIH8+9FzcU6c3GZ4OgzmNZZ0cXx823K08N37aELe60Ch5wwEG
 lftnEzoF6XYL5P7BUE8uSmSsfOAv4/lC6LQOxFLiH5f6skgO6KxxCO44frhvtas6dbLD
 r1HVPXpvzneiq1xL5Uz6xu/TNpU1RuwDK9mx9+twxlH0WBI80hncz1URg6X2SwO1DwSI
 7f1A==
X-Gm-Message-State: AOAM530XYtOYLXKtKmBudBjiIEnpnTkZjmaRWrOnUaWSzJQ6t/yRwRZK
 G9Ri6eF/UOAGBlu81ysS89+vVKBVIeccq7dvfVHKudMMZ9/3VVfw9/mU1rWLJu3TP5GTjckd1Jj
 +I/AdF0QB9eNEbv2lPEoQfIHFIMB3GWjIJQoYKX5EtNWgkZTPui5gV8dEjJhyLmXq
X-Received: by 2002:a05:6830:110f:: with SMTP id
 w15mr124125otq.57.1618436955387; 
 Wed, 14 Apr 2021 14:49:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGg2jJayO+n+1iQnU4rwVNHZvdtCtGf1U5YYC75aArHF+szOMIVhUhxKSP62v64UXoGMVv/g==
X-Received: by 2002:a05:6830:110f:: with SMTP id
 w15mr124116otq.57.1618436955192; 
 Wed, 14 Apr 2021 14:49:15 -0700 (PDT)
Received: from localhost (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id m3sm164104oiw.27.2021.04.14.14.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 14:49:14 -0700 (PDT)
Mime-Version: 1.0
To: "Carlos Venegas" <jose.carlos.venegas.munoz@intel.com>,
 <virtio-fs@redhat.com>
Subject: Re: [PATCH 0/2] virtiofsd: Enable xattr if xattrmap is used
From: "Connor Kuehl" <ckuehl@redhat.com>
Date: Wed, 14 Apr 2021 16:47:55 -0500
Message-Id: <CANRZOP7US2Z.118EXV1M0KTZO@redhat>
In-Reply-To: <20210414201207.3612432-1-jose.carlos.venegas.munoz@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed Apr 14, 2021 at 3:12 PM CDT, Carlos Venegas wrote:
>
> Using xattrmap for Kata Containers we found that xattr is should be used
> or xattrmap wont work. These patches enable xattr when -o xattrmap is
> used. Also, they add help for the xattrmap option on `virtiofsd --help`
> output.
>
> Carlos Venegas (2):
> virtiofsd: Allow use "-o xattrmap" without "-o xattr"
> virtiofsd: Add help for -o xattr-mapping

Good usability improvement.

For the series:

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


