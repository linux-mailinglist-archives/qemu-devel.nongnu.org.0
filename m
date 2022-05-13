Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE9D525C49
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 09:21:10 +0200 (CEST)
Received: from localhost ([::1]:44018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npPbq-0006pt-1d
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 03:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npPOX-0005uy-3P
 for qemu-devel@nongnu.org; Fri, 13 May 2022 03:07:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npPOU-000628-AD
 for qemu-devel@nongnu.org; Fri, 13 May 2022 03:07:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652425641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=IGg0Q/fAOOS91yCdsEC3DrdrrTJjAfYWgF6nAe8Z+QI0S4TGpOWvY8gkik/YDp77QyCKUA
 2ovJtdm/XKmPqoQ08XnUkdOCOQq7BY5vtLbzRq91VkWa2RNhYO5qdh92/lebcsKPhsePGI
 y8c+YjhJHl6OTc4zSnbHKFSaJ5q2jlM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-sDpETDLeN8qX-Kn9LviCcg-1; Fri, 13 May 2022 03:07:20 -0400
X-MC-Unique: sDpETDLeN8qX-Kn9LviCcg-1
Received: by mail-ed1-f72.google.com with SMTP id
 f1-20020a50fe01000000b004282af18d8bso4439746edt.23
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 00:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=lkUuGORawj9hbu4QNLRxnaQcrV8yg/8znIrJBZs+U7N3efBWGs88k16lomsQKN4uN1
 yFckTpX4YTV7ifwoP7Dy2k1OfmBz+2BxeGlWWn1tyxCqnz+zS0BYJ2Vf6ujbRQdod0l8
 3VKG/eUPlVXxooxf74LbaWRdKJr/W7NLB3U4dUOYZbsNqqBKa9IF++/bLxFojPXCEImL
 AGwc/hVkL1LXPc/bEsR7wrJJ6K5k18f02npOnV6dPZ1yltgtUXFkA0gQ0ewYM9nVPDoh
 mXDFMknDzzfOBLAejzj2QoOjTOcqIJO55TDY97vUI2LyXbJFg4+g8rPZVK+tzrgtKy5A
 Kl2Q==
X-Gm-Message-State: AOAM531u4nX6I9XwaFTEo330uZb3BmQWvtoa/AE8cTPysIR64+qPC+gZ
 1DfagTTSwSVFT9qsU8QqTAcun4vAG9i5kpUkTV6sLLYYoQn7w2a70ygqFNgYUU/r9khCpCg3TzW
 Yy+FO80hsIHMbwb0=
X-Received: by 2002:a17:907:d1d:b0:6fa:1f27:b39 with SMTP id
 gn29-20020a1709070d1d00b006fa1f270b39mr2898771ejc.146.1652425639573; 
 Fri, 13 May 2022 00:07:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmLU7SNgT5+ucQM/YQKZyjnw1MCLaa7+txY4mPzcS93DDyUhwvU/9cv9R0TNRaEDBQWUYLZQ==
X-Received: by 2002:a17:907:d1d:b0:6fa:1f27:b39 with SMTP id
 gn29-20020a1709070d1d00b006fa1f270b39mr2898765ejc.146.1652425639427; 
 Fri, 13 May 2022 00:07:19 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 eb22-20020a170907281600b006f3ef214e28sm464393ejc.142.2022.05.13.00.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 00:07:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH] qga-vss: Use a proper function for free memory
Date: Fri, 13 May 2022 09:07:15 +0200
Message-Id: <20220513070715.1076718-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512154909.331481-1-kkostiuk@redhat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Queued, thanks.

Paolo


