Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 899CF6E7484
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 09:57:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp2fd-00023c-51; Wed, 19 Apr 2023 03:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pp2fa-00023T-Gd
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 03:56:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pp2fX-00056O-UF
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 03:56:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681890958;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=SrDd8kW+w0DCaJKCEOAWSxq/P7lG0SjBmMooUk9r3Dc=;
 b=ORXRdGX/aouuTXF4QepFMoNTYkRQTDsJ9yGVHFwL5iE7Tus/NkKPh0aGwiVskB6t86XKwC
 Tb5OC6FrExU8LF6HJGR/bOXpruTosi/bDh9GG/ySicZsRgeyCpU900mJRXQi0tngIKlQcv
 +WkHMNyjEXX6fmnmAbI6hj36qZ+tUo8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-0SbXoY3sOcq5bHn6zcwUUg-1; Wed, 19 Apr 2023 03:55:56 -0400
X-MC-Unique: 0SbXoY3sOcq5bHn6zcwUUg-1
Received: by mail-wm1-f71.google.com with SMTP id
 i13-20020a05600c354d00b003f17a4914a2so666879wmq.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 00:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681890955; x=1684482955;
 h=mime-version:message-id:date:reply-to:user-agent:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SrDd8kW+w0DCaJKCEOAWSxq/P7lG0SjBmMooUk9r3Dc=;
 b=Q6annSejlHcWhtTTCkFmtIVtWLNGFAsryu5J4in7Sb+U7cwwy75ny8m/UjCudjiDg/
 5U7mNL//h/sGQe50M0runiiGTgQYD57TiJNOY8MB2B4kUgk32odcXTbCgK0JBJotz/kJ
 nQ5begqvqi/WlwLU9O4x+y3LCiSRJ0k6SvYocXdgjW09BZIukKhBrfYFVAgRDPzw6qIM
 9zWpqMl8NSuLMC+H9Kk4jBAIPXuraFLyJBYzhTp9zTuLwFsahvchRhEh1DJ8eyYt5KDq
 RNkAaz3gYnWRabUzTGK0/A0OXbu1gKxW4PJUlOmU2BXx0k0EXzgg5AIeaJpkh4NqiGFz
 LAjg==
X-Gm-Message-State: AAQBX9cud9DY2w8NDbJLaIAkAgL5pgtZejcXya8pHhVad/bqZzSKn9Ql
 McMPLR4a2iDmHTJ8XG91fN8L2ozoiRencE+DU1XpstxJ5oleq5gNqIFQExGuPn6VX9hMPnMzAD8
 84vJ2xl/HbXeu1sA=
X-Received: by 2002:a7b:c7c9:0:b0:3f1:6ecf:537 with SMTP id
 z9-20020a7bc7c9000000b003f16ecf0537mr9924955wmk.33.1681890955059; 
 Wed, 19 Apr 2023 00:55:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350aYaRM8bZF69Wg31uI9cc56cZlQSgc5rNzXbZToFP+FrglvkH5WSr9/erQTEd2v9V0PZCD/aQ==
X-Received: by 2002:a7b:c7c9:0:b0:3f1:6ecf:537 with SMTP id
 z9-20020a7bc7c9000000b003f16ecf0537mr9924940wmk.33.1681890954760; 
 Wed, 19 Apr 2023 00:55:54 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c000900b003f0aa490336sm1309023wmc.26.2023.04.19.00.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 00:55:54 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org
Subject: KVM call minutes for 2023-04-18
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 19 Apr 2023 09:55:53 +0200
Message-ID: <87mt341f1y.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Hi

We started testing with recording the call, will 


Update on icount

Enable icount to be "enabled" independently of tcg.

icount + ttcg breaks, so there needs to be done some changes here.

The plugin allows to plug into the timer subsystem, so all the times are available.

Having multithread ttcg makes things complicated.

We don't want three versions of icount:
- deterministic
- multithread
- ....

The plugin only allows some primitives to handle the times, not the
full power of TCG.

We will try to break out the icount generation without disturbing
determinism.

The plugin will be able to calculate the time, and everything else
will read it from there.

The current code will continue to be as it is, and will not work with
multithread ttcg.


We got a recording of the call here:

https://fileserver.linaro.org/s/nJTSCLyQBfo6GLJ

Thanks to Alex for storing it.

Later, Juan.


