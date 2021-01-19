Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B502FBCE0
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:51:20 +0100 (CET)
Received: from localhost ([::1]:40386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1uDv-0004Fz-5F
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:51:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1u2j-0002L4-1G
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:39:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1u2g-00086L-VL
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:39:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611074380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3gwvvmnmTBYYOCfokOxnehykd/YYR6CfyhlXS4IIlU0=;
 b=P7sWcri9lgxcn6vnAkI/6LPgXeE1jpO3a2FJrdd7E5Y9+xNFbXq4m+OLx9in1LWXjVooao
 vCo0tZ4vaVS9EVTXETQ5UsD+YSDEciQHGh96qudHTmyutVuLgTFDutXF6yaUZnWegQsuTS
 rSP9LVAug5Ew2V4b3WsJRkzc1UnSfWU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-U5nQ0o6-MmaIrBDjGEZTbw-1; Tue, 19 Jan 2021 11:39:34 -0500
X-MC-Unique: U5nQ0o6-MmaIrBDjGEZTbw-1
Received: by mail-wm1-f70.google.com with SMTP id s10so118521wme.8
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 08:39:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3gwvvmnmTBYYOCfokOxnehykd/YYR6CfyhlXS4IIlU0=;
 b=LIh95rT9RqGKO++IREbSHxYs8B7PSqqj4xofP/loqhL6gv0HU2GIIIrVAo2EO+XbYm
 qjTvsECJ0GDURMIUflmboUo827oIF0uTDTkKtp1ijXab7uBDTM+R5i7mCIpIeCbhWJcL
 7buscXAD2+wIUIaYor+Uc8MIfkz9nrbw7KBvTjmTeTADAzFdqMg4UdwTJzlYN6CZT92c
 FaT6n7TPB1vgiuAh5WgJposSosV+KO1nlazkO8LWqzeYzDyI7ETpCjaEcDXPLqEyC7oN
 MQeGF+kzAXv77gXZOBkaC/dDcAThWSQ4/VjuzNyMzElqdcX+MTMxshhpvhODUvEkNLqw
 IAtw==
X-Gm-Message-State: AOAM5338j4ZS+0wxDJmkUviK9/Sl8Kmtu/zIgvOL8VnLvxahZ0L7pL+Q
 V1oU7eCq6eDvWSznjstF1UehCPBuvuCxHfgavGxBn5jHGXBNe/5EfYruSHuEo0tPhAOQkmJ20yn
 AFNKLtJh1hK2i9yE=
X-Received: by 2002:a5d:4e8c:: with SMTP id e12mr5014986wru.321.1611074373414; 
 Tue, 19 Jan 2021 08:39:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfTn7spzfM4fyK0WCDwObvS+zPO89f1dM7+DYbcCuYe1MNTtc/WIMqDfzlAdIGtS8N/9YOWA==
X-Received: by 2002:a5d:4e8c:: with SMTP id e12mr5014969wru.321.1611074373171; 
 Tue, 19 Jan 2021 08:39:33 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x25sm5562666wmk.20.2021.01.19.08.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 08:39:32 -0800 (PST)
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210119132619.302207-1-pbonzini@redhat.com>
 <20210119145622.GC288294@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] deploy docs to qemu-project.org from GitLab CI
Message-ID: <a593df77-47cc-2a8d-2083-74be3183ec57@redhat.com>
Date: Tue, 19 Jan 2021 17:39:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210119145622.GC288294@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/01/21 15:56, Stefan Hajnoczi wrote:
> Hmm...the UNIX account on qemu.org is locked down to some extent but I
> don't feel comfortable with a GitLab CI job sshing into qemu.org.

As you say, the qemu-deploy account on qemu.org is limited to writing to 
/var/www/qemu-project.org.  Its own home directory is also limited with 
"chattr +i".

The same CI runners are already using the qemu-deploy user to deploy the 
website itself.  (To state the obvious, you can only do this if you can 
push to the qemu-project GitLab organization.  Regular users can 
configure their fork to deploy to a different server using a different 
ssh private key, but their CI jobs won't touch qemu-project.org).

There are other ways to do defense in depth.

We could use https://www.hashicorp.com/cloud-platform for the ssh 
private key.  Right now the ssh private key (which of course only grants 
access to the qemu-deploy user) is accessible to everyone with 
administrator access to the QEMU GitLab project; a Vault instance could 
have more limited access.

With respect to the ssh private key, however, a bigger risk factor is 
that a botched (even if not malicious) patch can reach the QEMU or 
qemu-web git repositories, causing the private key to appear in public 
CI logs.  To mitigate this we could set up a restricted bash for the 
qemu-deploy user on qemu.org.  It would require small changes to 
gitlab-ci.yml to avoid the "cd" command, as well as configuring a 
restricted PATH via ~/.ssh/environment, but overall it would be easy. 
It would also protect against a malicious actor sneaking in a patch to 
gitlab-ci.yml that makes it do bad things.

Neither of these has to be done now.  The current way to do things is 
more or less what GitLab recommends so, security-wise, it's not entirely 
broken.

> ssh access aside, we are publishing HTML from a shared CI runner to
> qemu.org. Effectively we are allowing an untrusted machine to publish
> HTML/JS/CSS on qemu.org. It could steal HTTP Cookies or do other
> malicious things.

Note that we don't use cookies on www.qemu.org and don't have a CORS 
policy either.  Only wiki.qemu.org uses cookies.

Paolo

> That is less of a problem when there is a dedicated
> subdomain so that the Same Origin policy can provide isolation. Maybe
> there are more recent web security mechanisms that allow us to define a
> policy so browsers do not treat qemu.org/docs/* the same as other
> qemu.org pages?
> 
> (This wasn't a problem before since the container was running on a
> dedicated instance under our control.)


