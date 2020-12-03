Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0D92CDBA0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 17:56:24 +0100 (CET)
Received: from localhost ([::1]:56930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkru3-00048y-T4
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 11:56:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkrok-00015x-Rz
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:50:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkroj-0008M6-2R
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:50:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607014252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Py+0fFjtPpio5bCl0syxdFwMPT4UoQMbxIXlItrl4E8=;
 b=ADgG4V8vBdi1zbLUfB8ZKfh73KngATl/5Hq7ZEr05UOeRHcf2aVEs0392VJ48CFGZG3epm
 gcX/0RJvP/OUS1CKjXU2vbqgxN7tqQT2Y2nIbeKQd5FRWwzbcZ7iGBPWJUajiQGX/defcv
 L0a8kxmq8zmPu2VB58gmH21gKKZyIhs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-0SYDZRaJPUGDcVG_0P8aEw-1; Thu, 03 Dec 2020 11:50:50 -0500
X-MC-Unique: 0SYDZRaJPUGDcVG_0P8aEw-1
Received: by mail-ej1-f71.google.com with SMTP id n17so1001973eja.23
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 08:50:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Py+0fFjtPpio5bCl0syxdFwMPT4UoQMbxIXlItrl4E8=;
 b=s0mZ60qlvEQNpi5D/omLUGelWW8Rae05M2zwyg+VPHxujkKLX3XxDsePJdDsFzRKxv
 DkX6TBBzuyO3AybPvNCaKb3GR7FIy7E0Kd+9UlCBHo7ueKWT1ef+fu0ARXiqy6tZJjsn
 fbL9eDuHnzWwzTr/cTMdT3XY5ezR7HzvaSkWDWnV5g5sxZDjXAoKPAtOM2Bx+iGbwwXx
 fjIh46JZio21zNOEhAoj1KLMEWruQ2RthOUCNznfLyUwzJIIOFMc6DvXnn3QcNZGbJtd
 4ESi4kOj16Q9uYTDwb/bPetROiz7Dt3MKyYlJIQMVyFD86d0pS9XvKhkpPIIVjsaa+ZZ
 7LWQ==
X-Gm-Message-State: AOAM531OIoYkhcszwWPGd0QgQ33DQ6mkwgWvPgkDN8lasFsY9DgrtlQV
 uZiaWsPmdv3ZzPvjqKY2gOzM7Ccii0gRdPg7daO96cxhIznp4mwJzweMTjZrhrJy7HpQWIDNDcu
 /wfd98jy6e3OMOMs=
X-Received: by 2002:a17:907:435c:: with SMTP id
 oc20mr3446286ejb.286.1607014249359; 
 Thu, 03 Dec 2020 08:50:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxTaaPtGoJ015kDc6NME7w3F9xBd/DLIB+SYUxLMGSYTxEUqEv/Q2xvYsAltolswJmPTfaiw==
X-Received: by 2002:a17:907:435c:: with SMTP id
 oc20mr3446257ejb.286.1607014249110; 
 Thu, 03 Dec 2020 08:50:49 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a20sm1805731edj.81.2020.12.03.08.50.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 08:50:47 -0800 (PST)
To: Kevin Wolf <kwolf@redhat.com>
References: <3449b5d6-d094-84c8-a0ea-4cd25364db2d@redhat.com>
 <20201201220854.GC3836@habkost.net>
 <17afbbfe-209f-e4b2-e9e1-b50abe1fce3c@redhat.com>
 <20201202125124.GD3836@habkost.net>
 <69dff34f-d87b-3a8d-640f-35f6bf5db75c@redhat.com>
 <20201202135451.GE3836@habkost.net> <20201202151713.GE16765@merkur.fritz.box>
 <20201202160554.GG3836@habkost.net> <20201202173506.GH16765@merkur.fritz.box>
 <54637ad5-0662-24ea-d738-1d53e054a103@redhat.com>
 <20201203151532.GA5409@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <27f30494-225c-4407-ee1c-1a996b83c8b1@redhat.com>
Date: Thu, 3 Dec 2020 17:50:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201203151532.GA5409@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, libvir-list@redhat.com, armbru@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/12/20 16:15, Kevin Wolf wrote:
> I don't think this is an intermediate state like Eduardo wants to have.
> Creating the object, then setting properties, then realize [1] will fail
> after your change. But keeping it working was the whole point of the
> exercise.

With the sample code, you must remove object_class_property_set calls at 
the same time as you remove the setters.  Usually that'd be when you 
convert to QAPI and oc->configure, but it doesn't have to be that way if 
there are good reasons not to do so.

Also, it still allows you to do so one class at a time, and I *think* 
the presence of subclasses or superclasses doesn't matter (only whether 
properties are still writable).  We can use chardevs (see ChardevCommon 
in qapi/char.json) to validate that before tackling devices.

(In fact, this means that your series---plus -object and object_add 
conversion---would be good, pretty much unchanged, as a first step.  The 
second would be adding oc->configure and object_configure, and 
converting all user-creatable objects to oc->configure.  The third would 
involve QAPI code generation).

> I'm also not really sure why you go from RngEgdOptions to QObject to a
> visitor, only to reconstruct RngEgdOptions at the end.

The two visits are just because you cannot create an input visitor 
directly on C data. I stole that from your patch 18/18 actually, just 
with object_new+object_configure instead of user_creatable_add_type.

But I wouldn't read too much in the automatically-generated *_new 
functions since they are already in QAPI code generator territory. 
Instead the basic object_configure idea can be applied even without 
having automatic code generation.

> I think the class
> implementations should have a normal C interface without visitors and we
> should be able to just pass the existing RngEgdOptions object (or the
> individual values for its fields for 'boxed': false).

Sure, however that requires changes to the QAPI code generator which was 
only item (3) in your list list.  Until then you can already work with a 
visitor interface:

   void rng_egd_configure(Object *obj, Visitor *v, Error **errp)
   {
       RngEgd *s = RNG_EGD(obj);
       s->config = g_new0(MemoryBackendOptions, 1);
       visit_type_MemoryBackendOptions(v, NULL, &s->config, errp);

       s->config->share = (s->config->has_share
                           ? s->config->share : false);
       ...
   }

but if you had a QAPI description

   { 'object': 'RngEgd',
     'qom-type': 'rng-egd',
     'configuration': 'RngEgdOptions',
     'boxed': true
   }

the QAPI generator could produce the oc->configure implementation. 
Similar to commands, that implementation would be an unmarshaling 
wrapper that calls out to the natural C interface:

   void qapi_RngEgd_configure(Object *obj, Visitor *v, Error **errp);
   {
       Error *local_err = NULL;
       g_autoptr(MemoryBackendOptions) *config =
           g_new0(MemoryBackendOptions, 1);
       visit_type_MemoryBackendOptions(v, NULL, &s->config, &local_err);
       if (local_err) {
           error_propagate(errp, local_err);
           return;
       }
       qom_rng_egd_configure(RNG_EGD(obj), config, errp);
   }

   void qom_rng_egd_configure(RngEng *s,
                              RngEgdOptions *config,
                              Error **errp)
   {
       config->share = (config->has_share
                        ? config->share : false);
       ...
       s->config = QAPI_CLONE(RngEgdOptions, config);
   }

Paolo


