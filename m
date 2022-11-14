Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1012E628E81
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:39:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouik3-0004pW-VT; Mon, 14 Nov 2022 18:19:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouif5-0001yn-U4
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oubFk-0002kx-Gw
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 10:20:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668439204;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=hKDPPoYZ6WZKWBaSHlY3qtcEr3ZaA1qaRsKsk4vR3Hk=;
 b=jCO0tBSSPLpiOTvI+I3rUamYPe0cniOI2m6j9jo9tiljcunFp/ADadVw+qQomw+PVoBo56
 huen8mJ+RBDTeVmpo9WacrAaG5R0ko7l6R+HmGe1Psj7ILqZRTNaugsSRD0ZNJDaNO6Pli
 zLzF/9zDXen+BGUOwseIM/H+dXa08dg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-572-goUDZRCSN3KOstgSOQhK3w-1; Mon, 14 Nov 2022 10:20:02 -0500
X-MC-Unique: goUDZRCSN3KOstgSOQhK3w-1
Received: by mail-wr1-f70.google.com with SMTP id
 c18-20020adfa312000000b002364fabf2ceso2092805wrb.2
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 07:20:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hKDPPoYZ6WZKWBaSHlY3qtcEr3ZaA1qaRsKsk4vR3Hk=;
 b=vEwyFig5NajEInP/3a3WD9vUkQ3Ylm38IYTz9lorxeDeOZmdiMN8/msVCVE55x2717
 LZU+Ug7eKBApPKxrTAo03nM6ThH9p5YMxikcKt+CmwoMLqMlOfMmS9gNsoLheYr5U24p
 pzNtCX5VI2Mt9nXtp6bpK+V6Le55Kdd9LdJBSHxMRpgS1ie3cJ8BvnTuYqnLQSI/slWf
 cTiDXpZoucTOySA6T+VA8oOsDjchXtumf1EqhjXXiK7I+vKvpxjID7O697rAHFi7A9tL
 05lyOAwy3vXqjWnLZNf8e/qzkJokLZWWQBWmK5Wt6tldXsuNrcX596XInHepwnVIinbU
 CBsw==
X-Gm-Message-State: ANoB5pkLVw/KKX1xd3KjUVC76pTNGwgNWjlCpIbjrx6bxUxBVNzI2hrj
 XPmRIzhrerkh2zb/uTOEY2ScWQXO3A5jszdv44zu6ne0ad4o+FA2qG8MaFZfQ4NGjW8L71ePZFi
 oy3/GpAXYOmV7m6E=
X-Received: by 2002:a05:600c:207:b0:3cf:baa6:8ca5 with SMTP id
 7-20020a05600c020700b003cfbaa68ca5mr8118620wmi.178.1668439201404; 
 Mon, 14 Nov 2022 07:20:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4bjd2lmJVSE8Swtzv+xgdCnxf9GysBF1qADcIobbucfFhxh4o2bz+elY1EvdkVvw3Ila5d3A==
X-Received: by 2002:a05:600c:207:b0:3cf:baa6:8ca5 with SMTP id
 7-20020a05600c020700b003cfbaa68ca5mr8118601wmi.178.1668439201200; 
 Mon, 14 Nov 2022 07:20:01 -0800 (PST)
Received: from localhost ([31.4.176.155]) by smtp.gmail.com with ESMTPSA id
 bw24-20020a0560001f9800b00226dba960b4sm9858787wrb.3.2022.11.14.07.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 07:20:00 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,  ani@anisinha.ca,  Leonardo
 Bras Soares Passos <lsoaresp@redhat.com>,  Manish Mishra
 <manish.mishra@nutanix.com>
Subject: Re: [PATCH v2 12/15] migration: Move last_sent_block into
 PageSearchStatus
In-Reply-To: <20221011215559.602584-13-peterx@redhat.com> (Peter Xu's message
 of "Tue, 11 Oct 2022 17:55:56 -0400")
References: <20221011215559.602584-1-peterx@redhat.com>
 <20221011215559.602584-13-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 14 Nov 2022 16:19:59 +0100
Message-ID: <87cz9pa7hc.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> Since we use PageSearchStatus to represent a channel, it makes perfect
> sense to keep last_sent_block (aka, leverage RAM_SAVE_FLAG_CONTINUE) to be
> per-channel rather than global because each channel can be sending
> different pages on ramblocks.
>
> Hence move it from RAMState into PageSearchStatus.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


