Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5786680559
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 06:03:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMMKP-0002hG-30; Mon, 30 Jan 2023 00:03:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMK3-0002h3-39
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:03:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMMK1-00005I-Lr
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 00:03:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675054993;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=DrVLU0PM0mBFsi907QA5zX91ZPmjeNnPIHCzSdk5id4=;
 b=FeSgKHgnnPJY87ORFsiUH9sAL4oYBGbaCV74Ixd9ozavaRLUanOYXpODhWEApjKAk0CnFO
 gKCctHeBlHnElbQB53r1eCa22zfDooJIpwdUP911QKUL4Pj13KwVw4IXIfk1zKsVibh5l3
 9YHvAmnV5ajJaiCakvrkBHeFr8e7vN8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-411-YgGQFa6sO3a_4CJmiQLf7g-1; Mon, 30 Jan 2023 00:02:41 -0500
X-MC-Unique: YgGQFa6sO3a_4CJmiQLf7g-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg24-20020a05600c3c9800b003db0ddddb6fso6629392wmb.0
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 21:02:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DrVLU0PM0mBFsi907QA5zX91ZPmjeNnPIHCzSdk5id4=;
 b=3ttV+Z8RvLbhnvV4+FUst72SvfVPIimq0ATdsQePSwREKqp1okgAIFQT8yVwjd7Xyf
 /AvgMoMvyOEntHlKBxc0L4gspujlPsToRoxHKx+jjbcTTGTX1SyirbFFrxTXBOiNqyV9
 Y6JuXidID02CcNFu8hMfUNjPqmQ/2L1XHdjY5EaWVlIAASLMaJ2PksMBCITQG/AWnEU7
 efG4J2i40FeDeYBHOrcHVQfgbs+OzDwA5IW0WHR8S183GyVD491fL0nlkp2H5UOS7Tkj
 edTZjAZN8HFp+chaLxWc94keIbgFIyaUWz4b5QqwgtLh+FjC3azsLM+TuaVfygeEVDeQ
 8XAQ==
X-Gm-Message-State: AFqh2koFjn0hTiztrZquna0+1qB5lLmY9Ra8auakOf9Q8WgAtjr1sKg+
 E7FOPCOpMjySEWfjeoNMqrXzdXFxKWQeqTXxMeJsRNwpj75ZULqNtE66tWG3GviWQ/pe1BGzo6Q
 zjI7HPzxDNw/mL1g=
X-Received: by 2002:a05:600c:1c8e:b0:3d9:e5f9:984c with SMTP id
 k14-20020a05600c1c8e00b003d9e5f9984cmr50327022wms.2.1675054960109; 
 Sun, 29 Jan 2023 21:02:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtc/YV9/trU8F5XLLHKhVL5bbv3Za17csKPDFrubpoVEVQanMB0cbE7F6fZUPhy4hJ840qRKw==
X-Received: by 2002:a05:600c:1c8e:b0:3d9:e5f9:984c with SMTP id
 k14-20020a05600c1c8e00b003d9e5f9984cmr50327012wms.2.1675054959939; 
 Sun, 29 Jan 2023 21:02:39 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 l9-20020a05600c4f0900b003db32ccf4bfsm16887323wmq.41.2023.01.29.21.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 21:02:39 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  James Houghton <jthoughton@google.com>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 07/21] ramblock: Cache file offset for file-backed
 ramblocks
In-Reply-To: <20230117220914.2062125-8-peterx@redhat.com> (Peter Xu's message
 of "Tue, 17 Jan 2023 17:09:00 -0500")
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-8-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 06:02:38 +0100
Message-ID: <87cz6wk429.fsf@secure.mitica>
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
> This value was only used for mmap() when we want to map at a specific
> offset of the file for memory.  To be prepared that we might do another map
> upon the same range for whatever reason, cache the offset so we know how to
> map again on the same range.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

A bit weird that we don't use it (yet) anywhere, but that is life.


