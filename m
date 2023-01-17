Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5C866D6DB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 08:26:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHgLb-0007Ef-Gj; Tue, 17 Jan 2023 02:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHgLW-0007E9-3c
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 02:25:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHgLU-0002Zc-P9
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 02:25:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673940323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O4zBoqJqPzwMibjvR7F5l/g+QNwG5fVvLTJIc31O8EI=;
 b=VNz6yDjLMEwIhpEK+Y927xTAbusrAviFxcZPnPWCgMdtWHvwS8XauphKoSnSGPSHdfp3KQ
 WEwDmdXgcmTKntJ7f363DHn4yfi9lNfomdgEcS0TRnHnUV0ftCm9HCXngwdu40LWTiMgIG
 6/dzHxqii0WD+JxxHLvn538u68GKsUQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-184-Sn6JlgYXPyerJfcqYGDRXw-1; Tue, 17 Jan 2023 02:25:22 -0500
X-MC-Unique: Sn6JlgYXPyerJfcqYGDRXw-1
Received: by mail-qv1-f70.google.com with SMTP id
 r10-20020ad4522a000000b004d28fcbfe17so15519143qvq.4
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 23:25:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O4zBoqJqPzwMibjvR7F5l/g+QNwG5fVvLTJIc31O8EI=;
 b=qH9WSm/AGLOmWuy8fzQ+/9fEtTkbMPThzCbBBAhu3xzlOWgyARqjUEUQkDbLD69rJM
 uNRn8zxIbo/EuMF7B3x774nkxmquZugYbXOeNdRmeQqUCdzAkOux78PmQjAcFbQFtB8P
 iJr4+kg3dyJ4TKw8iJMKbCWi6tu/skEpmbXCo8Cuy7kq2ocMkAGJJSEOlJ1x3LLn0gC2
 tbCenmFmAQ/YtuDcuWqAOaObr5QAdVRunllDnWrUcdFYtq0iRkcdoraLoe2CWi1EFyA0
 /9Fk32s3umLzbEZkVUKmxuUkAqLPyIzT3UIjcPWtkMkZzF7WF7/BvL0XKv5FX13yJ9s+
 iv/A==
X-Gm-Message-State: AFqh2kqiWNX3JKiGIVsG3WiSdVA+M4RnD6cpoRafXLeAa0qKVT5PvBU9
 emlXvO+T2a/CP+Ru3lqIMlfkrwfzoOXym4kvMFj1HaPW03RjlZRQg7BTOeh1We1C8OKnyatOb7M
 Tr/Z9f2/p17oU6gY=
X-Received: by 2002:ac8:5157:0:b0:3ab:28ea:d849 with SMTP id
 h23-20020ac85157000000b003ab28ead849mr2569598qtn.10.1673940321769; 
 Mon, 16 Jan 2023 23:25:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtaUo0fA+8zIftJnzJVB3TphzXIUKPSfzpt6Qm4mryPHeKyHHoyFrRHliHqQs+ezrX7a2pUPg==
X-Received: by 2002:ac8:5157:0:b0:3ab:28ea:d849 with SMTP id
 h23-20020ac85157000000b003ab28ead849mr2569579qtn.10.1673940321537; 
 Mon, 16 Jan 2023 23:25:21 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-26.web.vodafone.de.
 [109.43.177.26]) by smtp.gmail.com with ESMTPSA id
 h18-20020a05620a401200b007064fa2c616sm5241268qko.66.2023.01.16.23.25.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 23:25:21 -0800 (PST)
Message-ID: <d997124c-5ef5-6a1a-51a8-3000bb8526e3@redhat.com>
Date: Tue, 17 Jan 2023 08:25:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v14 01/11] s390x/cpu topology: adding s390 specificities
 to CPU topology
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org,
 borntraeger@de.ibm.com
Cc: qemu-devel@nongnu.org, pasic@linux.ibm.com, richard.henderson@linaro.org, 
 david@redhat.com, cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com, 
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, scgl@linux.ibm.com, frankja@linux.ibm.com,
 berrange@redhat.com, clg@kaod.org
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-2-pmorel@linux.ibm.com>
 <49d343fb-f41d-455a-8630-3db2650cfcd5@redhat.com>
 <619b3ebd-094a-cd8b-697c-de08ba788978@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <619b3ebd-094a-cd8b-697c-de08ba788978@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/01/2023 17.32, Pierre Morel wrote:
> 
> On 1/10/23 12:37, Thomas Huth wrote:
...
>> Other question: Do we have "node-id"s on s390x? If not, is that similar to 
>> books or drawers, i.e. just another word? If so, we should maybe rather 
>> re-use "nodes" instead of introducing a new name for the same thing?
> 
> We have theoretically nodes-id on s390x, it is the level 5 of the topology, 
> above drawers.
> Currently it is not used in s390x topology, the maximum level returned to a 
> LPAR host is 4.
> I suppose that it adds a possibility to link several s390x with a fast network.

Ok, thanks. So if nodes are indeed a concept on top of the other layers, and 
we do not really support these on s390x yet, should we maybe forbid them on 
s390x like we recently did with the "threads" in the recent machine types? 
... to avoid that users try to use them with the wrong expectations?

  Thomas



