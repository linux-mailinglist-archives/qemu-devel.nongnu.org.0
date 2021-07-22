Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E933D219C
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 12:04:14 +0200 (CEST)
Received: from localhost ([::1]:58674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6VYr-0003qf-UR
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 06:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m6VX8-00035K-2X
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 06:02:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m6VX2-0005j9-TI
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 06:02:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626948139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=HEpBb55tnElYX+mKyADiYPZpzjE05+pM+uEgy1SVpLY=;
 b=Xy0SOimmWM3dDwtTH4C54dUxggjVQEcH1cWOPEfKAGy0oQ3s5hVwrwzhfZweZ570vWW+Hw
 Ln45z1lyFQkIcrGSAdd8Y0MHhy9J/JjSKoFqmXw4W7pMeAUCo1dm13PwXGX43P2AUSAjio
 bPnW08OQCCcY77bvdxXxFPJH9ZM5nbI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-_hRkVAu2NUmmcI5JSIxX4w-1; Thu, 22 Jul 2021 06:02:18 -0400
X-MC-Unique: _hRkVAu2NUmmcI5JSIxX4w-1
Received: by mail-wr1-f72.google.com with SMTP id
 o10-20020a05600002cab02901426384855aso2251247wry.11
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 03:02:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=HEpBb55tnElYX+mKyADiYPZpzjE05+pM+uEgy1SVpLY=;
 b=fa0tGC24EX4AsEoN6DE063UzNknWvuptX317V6eVl74cKpytky+nqalSOweGlorYWX
 bvDwLUNPeBfYl2bImfH0vMAhIRaf+aaScZDDm4837p5kCFrXERlEZnda3K1dHDGhgzct
 Hf6k1Gu1hQlEJgsynmgYYHYGRbjQqRVIUjZE/et8vZPXX0Jyk7Fq1boJXjhTXo/wIAlL
 c2OOLe0NJjAyiq6pbnPxMfA1IFkpijAv0GMrYULCMfCApLWNTN1yUTQZzguSK041/l3i
 vpwtl77QD9tDSCSKo95VIGPTgVxLz1xS3rfH8gEUhkq6S2VVvuHwId2Sv2j/h6AxE4Wx
 DpQw==
X-Gm-Message-State: AOAM532REoU+SLAMCQu/VbEgtcn25gfZHL+sgnj4uUu3NihhnTXFQ1Oi
 E+vnBoMLiV/QPs2JQD44An++HllMmA4+yuBzpfLZJQ1FlvVKXAmqu3S0hVLOih2qGJuX4nFO/o1
 gACjE5A2m/kbWJAs=
X-Received: by 2002:a5d:5271:: with SMTP id l17mr46894870wrc.239.1626948137225; 
 Thu, 22 Jul 2021 03:02:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYDjWPzI35eFVpkyhFIS7BBNY9Dcu83VjAfiHCp/oNhdlidtKD+OIpcTgHexjnGiZzq4Y3KQ==
X-Received: by 2002:a5d:5271:: with SMTP id l17mr46894855wrc.239.1626948137073; 
 Thu, 22 Jul 2021 03:02:17 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id x18sm28753676wrw.19.2021.07.22.03.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 03:02:16 -0700 (PDT)
Date: Thu, 22 Jul 2021 11:02:14 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: richard.henderson@linaro.org
Subject: Prefetches in buffer_zero_*
Message-ID: <YPlCJpMIOb2Umc+Z@work-vm>
MIME-Version: 1.0
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: qemu-devel@nongnu.org, jmario@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,
  I think you were the last person to fiddle with the prefetching
in buffer_zero_avx2 and friends; Joe (cc'd) wondered if explicit
prefetching still made sense on modern CPUs, and that their hardware
generally figures stuff out better on simple increments.

  What was your thinking on this, and did you actually measure
any improvement?

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


