Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD1C43902D
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 09:17:19 +0200 (CEST)
Received: from localhost ([::1]:41570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meuEQ-0006Op-JH
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 03:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1meuD5-0005c2-AY
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 03:15:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1meuD0-0002g1-46
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 03:15:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635146147;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8WX5rSW/QmCFIeuFwXpZBTrQhkI0qobyAWpri5qGZTo=;
 b=gT43Vjb0ZxY9xtW2eheTza77yW9yNBdF5dYZqDY984cvu5CJ+BTbaZV3avsUZ6u4aDNmpq
 qUOUl08+yNfwV/DF0fEPB5deJtTAxonkU2tfVkfpMkXyJKHIeYyykMqji+XkQ4fMJBPunV
 WT5yJ/jFRQ6z+nwqMEJwTAk9IUNuEKA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-BiRRR51bP9yT0MOjCtiCkw-1; Mon, 25 Oct 2021 03:15:46 -0400
X-MC-Unique: BiRRR51bP9yT0MOjCtiCkw-1
Received: by mail-wm1-f70.google.com with SMTP id
 z20-20020a05600c221400b0032cb38a76a9so923449wml.8
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 00:15:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=8WX5rSW/QmCFIeuFwXpZBTrQhkI0qobyAWpri5qGZTo=;
 b=lyNu8yKujA+tX0bgw9oZ3VR7IpYgjLajvNEZodaDuhQncTvRnAjjbXOk4fmqPv0LLQ
 HUkas/NBMbrfT+xtiKKm/hxm2Ui8AMjgmiYPTuSjmO0LAg0cncGuiN10SYmZczI0SM+R
 ryBvpTXqqDXVg1IUE7FwbAtOIMG2aOwcFSHWocYyWrDe8mBrBoz7TSv5BCxvVABn23jO
 waozOHzZaB4pO82ZguWWWsZbwJp69YLTHpiBOHnzskxWdvEQdjLVe/emjdqxnhv70iIq
 TQSsTa/1Qu+X4akLf2iW/y088g5TlccziKOxD7UM4VsjBOwTDDOYjTZFmcfAUtG6WVno
 bXyg==
X-Gm-Message-State: AOAM532cMwEWaEmGFb+zKjAEkpSxtMcDL4oUEtRfoU+ziEX/v6DvJkcm
 e3sdS+d1COedv4DusSh5godTOJoSZSZyzywGaHwNO9CIl9kR0SZ7sRC3qjar/ffjc15NcbjPSbs
 D5zAjl5/a5l9Q8ys=
X-Received: by 2002:a5d:64ee:: with SMTP id g14mr21291269wri.376.1635146145345; 
 Mon, 25 Oct 2021 00:15:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUi4MLzqbLAJsfidGiUxn2IPbhgVawgXIRVlbov6knwqqaLot/ttx3NtyGg93FsvkPE2T3mQ==
X-Received: by 2002:a5d:64ee:: with SMTP id g14mr21291222wri.376.1635146145072; 
 Mon, 25 Oct 2021 00:15:45 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id w4sm11054318wrk.76.2021.10.25.00.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 00:15:44 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/9] qapi: New special feature flag "unstable"
In-Reply-To: <20211025052532.3859634-2-armbru@redhat.com> (Markus Armbruster's
 message of "Mon, 25 Oct 2021 07:25:24 +0200")
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-2-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 25 Oct 2021 09:15:40 +0200
Message-ID: <87mtmx378j.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 eblake@redhat.com, mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> wrote:
> By convention, names starting with "x-" are experimental.  The parts
> of external interfaces so named may be withdrawn or changed
> incompatibly in future releases.
>
> Drawback: promoting something from experimental to stable involves a
> name change.  Client code needs to be updated.
>
> Moreover, the convention is not universally observed:
>
> * QOM type "input-barrier" has properties "x-origin", "y-origin".
>   Looks accidental, but it's ABI since 4.2.
>
> * QOM types "memory-backend-file", "memory-backend-memfd",
>   "memory-backend-ram", and "memory-backend-epc" have a property
>   "x-use-canonical-path-for-ramblock-id" that is documented to be
>   stable despite its name.
>
> We could document these exceptions, but documentation helps only
> humans.  We want to recognize "unstable" in code, like "deprecated".
>
> Replace the convention by a new special feature flag "unstable".  It
> will be recognized by the QAPI generator, like the existing feature
> flag "deprecated", and unlike regular feature flags.
>
> This commit updates documentation and prepares tests.  The next commit
> updates the QAPI schema.  The remaining patches update the QAPI
> generator and wire up -compat policy checking.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


