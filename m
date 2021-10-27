Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 204C043C59F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 10:53:32 +0200 (CEST)
Received: from localhost ([::1]:51876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfegd-0001PG-8I
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 04:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfedo-00084R-QH
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 04:50:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfedi-0005o7-CN
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 04:50:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635324629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1bB2yyYlzymijurKa3l04IYLjaODl78eVYuQ+WT3Mnk=;
 b=Y5bJHbbr6P3dzs9SdTWNNtil1SG7mWwe/cq1SEHrVBUi5KrFDDRxy0x/nQirORUDZs6rAH
 hmgaRwpvsyWUXfhWVGsDhqbP79L7K5s3Eh47RPuJ0IlYYaXmUPa2aXG0pg2FS69S0o3t/G
 giVzlEMXLd7CKInqXQEakmpIWzkOGM0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-JDzscR_NOAS0d4GUuI6xaA-1; Wed, 27 Oct 2021 04:50:27 -0400
X-MC-Unique: JDzscR_NOAS0d4GUuI6xaA-1
Received: by mail-wr1-f69.google.com with SMTP id
 y9-20020a5d6209000000b001684625427eso403239wru.7
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 01:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1bB2yyYlzymijurKa3l04IYLjaODl78eVYuQ+WT3Mnk=;
 b=dZExOUns+wrVUGq9IVmqaM8R4xy+YQYWFGreI+4yYPGWJhcQBBeS/nUoDHe7cvfyO9
 HWVu8bVgXoYC8jV5m1EVVJFmxKplhhSNA72L9fyObOACGB4tSNwRExLfG04wsKAAcagj
 q0XMG25buO2mnXX0CO55ChKwn2Y/PIvYndImBNheo+HsPGX/m0ScMtQq9wXytWQTNq8v
 xAdkchkKTwL15HVBuBaQIgOBsWwKBf7+EMN0tzVyOMmqCL4HHcBHqBI1I+/Pvvlb29q7
 fOF7bTdLyDVrquCnP+NCHBQPU5U6DUU0KQTdjlcAJXq0ZStKcT8BoC5n7xupqmToijqC
 adzQ==
X-Gm-Message-State: AOAM530TP4qTO0gydNfJviaU5FiiZVFQC/hCXF//LxazCTP7sLdAN2TI
 XbLhjTHPBufyvNr2o68Ncpa+OPO0JnyRtmLWIwAoz5as5DXlAGFUMMqfyij3c6FaXWQ8uaAv7YI
 XY4QGvJ4IdT6Z7K8=
X-Received: by 2002:a05:600c:246:: with SMTP id 6mr4373854wmj.91.1635324626515; 
 Wed, 27 Oct 2021 01:50:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6EkQ7sKKAVs00EVWqL/oXnp/u+lMz0RAnUYNKf9tZ0xfF+wmkZyXtNeNYYu08xAwLLcIH/g==
X-Received: by 2002:a05:600c:246:: with SMTP id 6mr4373820wmj.91.1635324626228; 
 Wed, 27 Oct 2021 01:50:26 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id w14sm2621014wmi.37.2021.10.27.01.50.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 01:50:25 -0700 (PDT)
Message-ID: <805e0202-7499-041c-813e-045fb9b1bf84@redhat.com>
Date: Wed, 27 Oct 2021 10:50:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/1] gitlab-ci: Only push docker images to registry from
 /master branch
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211026145509.1029274-1-philmd@redhat.com>
 <20211026145509.1029274-2-philmd@redhat.com>
 <81fe6a1b-8577-bea5-b287-1faecfb1938b@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <81fe6a1b-8577-bea5-b287-1faecfb1938b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,

On 10/27/21 08:01, Thomas Huth wrote:
> On 26/10/2021 16.55, Philippe Mathieu-Daudé wrote:
>> Users expect images pulled from registry.gitlab.com/qemu-project/qemu/
>> to be stable. QEMU repository workflow pushes merge candidates to
>> the /staging branch, and on success the same commit is pushed as
>> /master. If /staging fails, we do not want to push the built images
>> to the registry. Therefore limit the 'docker push' command to the
>> /master branch on the mainstream CI. The fork behavior is unchanged.
> 
> Hmmm, what if I have a patch series that updates one of the containers
> and then also contains a new test that depends on the updated container?
> Won't that fail in the staging branch now and make me look bad?

Good point. My understanding is:

- All tests based on Docker containers pull from DOCKER_DEFAULT_REGISTRY
  (see tests/docker/Makefile.include). These tests can be run on CI
  but are principally run locally, using the ':latest' tag, which is
  the reason we don't want to push invalid / oudated images.

- CI tests also use the Docker containers. We might want to test freshly
  built images. Here we should explicit the use of local tag (without
  using the registry prefix) in this case. Otherwise default to the
  latest from registry (stable).

So the problem you mentioned is the second case, and should be reworked
in the YAML. I will revisit the overall CI YAML for your case, but the
first case seems equally important.

Regards,

Phil.


