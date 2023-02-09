Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E0F691169
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 20:35:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQCh0-0001Fa-F4; Thu, 09 Feb 2023 14:34:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQCgw-0001E4-WC
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 14:34:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQCgv-0000M5-Je
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 14:34:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675971284;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=dIYY8fkF37+cdEheAhnUQ0pjxuNORqEQoRcD1cTReck=;
 b=GW94WhFkaqzj68gM1HHdh0/boVE4FnpH5iP+yLdNNBkzUUAmWUfz6kIorfHpSKSMT7YbUD
 Qx6ylhD5IbV6PXWPnCsiiUfV7aNyKpREgxWSR3hUY+ygZyO2G6YxGo+5HNk1f1zI8ksYFX
 FKsntYMTie1zODkk+RNIpjw+yBuHcNM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-57-6Uu1HevCOfCmq1OwsorQ5Q-1; Thu, 09 Feb 2023 14:34:43 -0500
X-MC-Unique: 6Uu1HevCOfCmq1OwsorQ5Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 h5-20020adff185000000b002c3e68f9d6fso801880wro.10
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 11:34:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dIYY8fkF37+cdEheAhnUQ0pjxuNORqEQoRcD1cTReck=;
 b=VxKv3t7md6WU/16Br/dXaZ4BemoxB+stwb33HipVLbVK21pPX2khy1I3Cgjo9aqjGY
 9A4yzlvJNaO5803V8p6Q/JAFvCr4y5++9oLTY5wlYhZwXo7UW/RqkLOxEXHWuWbFVXTx
 MpiXvlu7OHwlhk7abWmnjuoCeb1lBsgcjYDcvx5KWK2H+3soqmJ8W+LxNLNY9q13eXq8
 MpApdAr3i4fxD9sYzMR3bAxUikpHTu2HAhKEBmMTljLP0WTQppiKtVtxCBsOa1LSIDuy
 oXaBNArR9SK4Pwaye6nyX/6ZnLv8xFurM9yJXbTpuXEbXQ9dvgLw2OzXzeq1e/0HPTc7
 AkaQ==
X-Gm-Message-State: AO0yUKVFLCnrXZLgmb1f/W5B7pmfzXioKEhD7zvb0EWK4vwpPpy0uAqp
 MFt7ziVmcZOWOmNT+w4A5eQH5ENQirPp7OfLCZfHKoTnYZU4tQL3SWcA+T4FEIk5JgRAVRyK/xG
 jp+ROWTT1ga/VjzDTN7zkemU=
X-Received: by 2002:a05:600c:4d97:b0:3de:e8c5:d833 with SMTP id
 v23-20020a05600c4d9700b003dee8c5d833mr14174441wmp.22.1675971281679; 
 Thu, 09 Feb 2023 11:34:41 -0800 (PST)
X-Google-Smtp-Source: AK7set+f9rlOw5MFnVb6ZWxtenunRXbJciQ6WCCQLvDxSEhPhmR5Mi9nTrBqGV4O0w1lIqD0nsZ7gA==
X-Received: by 2002:a05:600c:4d97:b0:3de:e8c5:d833 with SMTP id
 v23-20020a05600c4d9700b003dee8c5d833mr14174432wmp.22.1675971281471; 
 Thu, 09 Feb 2023 11:34:41 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b003dc34edacf8sm6487390wmq.31.2023.02.09.11.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 11:34:40 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  "Daniel P . Berrange" <berrange@redhat.com>,  "Dr
 . David Alan Gilbert" <dgilbert@redhat.com>,  Manish Mishra
 <manish.mishra@nutanix.com>
Subject: Re: [PATCH v3 2/4] migration: Cleanup postcopy_preempt_setup()
In-Reply-To: <20230208202813.1363225-3-peterx@redhat.com> (Peter Xu's message
 of "Wed, 8 Feb 2023 15:28:11 -0500")
References: <20230208202813.1363225-1-peterx@redhat.com>
 <20230208202813.1363225-3-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 09 Feb 2023 20:34:39 +0100
Message-ID: <871qmy3a5s.fsf@secure.mitica>
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
> Since we just dropped the only case where postcopy_preempt_setup() can
> return an error, it doesn't need a retval anymore because it never fails.
> Move the preempt check to the caller, preparing it to be used elsewhere to
> do nothing but as simple as kicking the async connection.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


