Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BB0575BE4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 08:54:32 +0200 (CEST)
Received: from localhost ([::1]:55686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCFDb-00047l-Fp
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 02:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oCFAE-0002Tt-LE
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 02:51:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oCFAA-0001Jc-Ot
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 02:51:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657867857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0nIYhHwa8iYiHcCqUBXgW6eAxtoeO4INnnokt0+AgNc=;
 b=BZ+qt7dM8pqFgkln6JlcM/CbGuRv4A5EgQIFd4SHSkUvPmIXu24F7pS3+VZZ3dnzqH23te
 6B+pnmjgFFUsS8raJNKnhpKULGV5LgRCXW4QlaxuOAfmLzyKv4yuc444gf7ailJsur3qWR
 tvapuDuJSdSTHfi4cE3KgiTPw6wr35s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-VEOaP0Z_N8qa8Y26eWqU9g-1; Fri, 15 Jul 2022 02:50:56 -0400
X-MC-Unique: VEOaP0Z_N8qa8Y26eWqU9g-1
Received: by mail-wm1-f70.google.com with SMTP id
 q15-20020a05600c040f00b003a2e5c8fca3so3816829wmb.7
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 23:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0nIYhHwa8iYiHcCqUBXgW6eAxtoeO4INnnokt0+AgNc=;
 b=C6YNeP/jXmSCliZ6F3RkQvlh7z5UlH/mcY5DPYBXuaZEzLS87NZBSJWliyi3CLQ8wR
 sEmFAot1MS2m4MYvaGISNJHnWEIgpcvVFbcmK2U43h2t4XzrY13xI4RLhU0kBEYRxAAI
 5khs0KnJ05UV9ku1VH2WAJXkNtxFwN0unfJ8SkcRselnCNFnVmJbcvtXIEfEFB2v2UHw
 r2ihtB2oeea7Rl1VAPXWK9gD8p5PM9ok302IgFC2qFOn81oiXBUn4/8LFHwQFjH9vR9i
 IDStwj1nLVQuOsrDHuReMKzGFAzbtsZQRMqICfHwMcYq/6WnYLnpnfXqFAHxpmMGY+rg
 PiQA==
X-Gm-Message-State: AJIora+LdDdMdQdgxofw/laprP+Qstyktn2d8JFgVaP5Jun4x363ayr+
 E33y6d2z2XNPgjU3HvIzzFL9Q9N7TZgKiqGqzxlAsNpDVVzMo9kVix8Eym5pr5hRzrgnLaA+Tlw
 WHLxCA5QJS4ddD6o=
X-Received: by 2002:a5d:4d90:0:b0:21d:70a9:985f with SMTP id
 b16-20020a5d4d90000000b0021d70a9985fmr11246175wru.565.1657867855142; 
 Thu, 14 Jul 2022 23:50:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ucz/ycYZn+tYha6XIZGMmWFgtLqjXZ0VifeN4tA5M62dDZiHa3NnAl9GSHSE/S7VIhmmdx5g==
X-Received: by 2002:a5d:4d90:0:b0:21d:70a9:985f with SMTP id
 b16-20020a5d4d90000000b0021d70a9985fmr11246154wru.565.1657867854842; 
 Thu, 14 Jul 2022 23:50:54 -0700 (PDT)
Received: from redhat.com ([2.52.24.42]) by smtp.gmail.com with ESMTPSA id
 w2-20020a05600c038200b003a309f412fcsm2089249wmd.11.2022.07.14.23.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 23:50:54 -0700 (PDT)
Date: Fri, 15 Jul 2022 02:50:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel@nongnu.org, thuth@redhat.com, peter.maydell@linaro.org,
 berrange@redhat.com, jsnow@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
Message-ID: <20220715015941-mutt-send-email-mst@kernel.org>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-8-ani@anisinha.ca>
 <20220714163611-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2207150929020.2162493@anisinha-lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2207150929020.2162493@anisinha-lenovo>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, Jul 15, 2022 at 09:47:27AM +0530, Ani Sinha wrote:
> > Instead of all this mess, can't we just spawn e.g. "git clone --depth 1"?
> > And if the directory exists I would fetch and checkout.
> 
> There are two reasons I can think of why I do not like this idea:
> 
> (a) a git clone of a whole directory would download all versions of the
> binary whereas we want only a specific version.

You mention shallow clone yourself, and I used --depth 1 above.

> Downloading a single file
> by shallow cloning or creating a git archive is overkill IMHO when a wget
> style retrieval works just fine.

However, it does not provide for versioning, tagging etc so you have
to implement your own schema.


> (b) we may later move the binary archives to a ftp server or a google
> drive. git/version control mechanisms are not the best place to store
> binary blobs IMHO. In this case also, wget also works.

surely neither ftp nor google drive are reasonable dependencies
for a free software project. But qemu does maintain an http server
already so that't a plus.



I am not insisting on git, but I do not like it that security,
mirroring, caching, versioning all have to be hand rolled and then
figured out by users and maintainers. Who frankly have other things to
do besides learning yet another boutique configuration language.

And I worry that after a while we come up with a new organization schema
for the files, old ones are moved around and nothing relying on the URL
works.  git is kind of good in that it enforces the idea that history is
immutable.

If not vanilla git can we find another utility we can reuse?

git lfs? It seems to be supported by both github and gitlab though
bizarrely github has bandwidth limits on git lfs but apparently not on
vanilla git. Hosting on qemu.org will require maintaining a server
there though.



All that said maybe we should just run with it as it is, just so we get
*something* in the door, and then worry about getting the storage side
straight before making this test a requirement for all acpi developers.

-- 
MST


