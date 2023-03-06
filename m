Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6579D6ABAA9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 11:04:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ7gW-0004ul-KL; Mon, 06 Mar 2023 05:03:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZ7gN-0004qZ-De
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 05:03:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZ7gJ-0008B2-0q
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 05:03:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678096978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k11QQVc4eoDz7r2I/WbOrzzgH/UDuom+B/F91BRYc0I=;
 b=N8suMQpzPeDR6EtEJC2zTD/TlSIVcGAoQv4Pf99QkSyorTkHVLH6+cz/gFbbZeCO+W5Hvb
 KNq2ATs385CBoRfs6S44bPc5mGoflhKPW6gI3GtKx1AjNycXBNGZid0XQtZOYFiZSk/8yg
 3KW4wvUWkSVfI3H5eoozsvVSy3kW/fM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-VNk68D1LPH6nKS_YthJUDA-1; Mon, 06 Mar 2023 05:02:55 -0500
X-MC-Unique: VNk68D1LPH6nKS_YthJUDA-1
Received: by mail-ed1-f71.google.com with SMTP id
 ev6-20020a056402540600b004bc2358ac04so13160083edb.21
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 02:02:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678096974;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k11QQVc4eoDz7r2I/WbOrzzgH/UDuom+B/F91BRYc0I=;
 b=M7jt7GUyqTf+JVoUMZWmAPeeSr9T2AGOMKIdIz5a/5+6QzPwGsgpYhKEzVxa1a+Bla
 3P8rcUWdXgBInnYmuU91Obg8DbK1i3oy4soIx4S47VOYIzWtMHFEXVZDcfxhVZ/zJd8c
 DWTKSaguhf2YzDiWJWu4rwMuGY3Q6Khf3AhgR0ghWq65kX3QZu7x8blUo84ElahN2G+l
 tqPTe4q34Eruwh3VTVU2XvAFYFYZUEQ3z9w5aQ38lBMISEfpIKl46FkRSJtvxa8LRyoI
 IxWwDBZdWrjthv1mKEgR03y+Ubl6WZ3GxoFvRqUg8OkOSnR3Y65eOuiaHDGJDp1uHpjP
 LerQ==
X-Gm-Message-State: AO0yUKXuR8IvwmfVUzGRlkoowGCBbJiVvYZMSk3IaHfD7JLZEc531pgV
 Pfaxidze44lB+WyqFGitcxMMKSHbIoztFs1lt/BoreNR3lboxTUHEMPvxlkETcnrQQ05dYqg5Qa
 siEwlqFa6LdkR+n0=
X-Received: by 2002:a17:906:9c8b:b0:8b1:76dd:f5ef with SMTP id
 fj11-20020a1709069c8b00b008b176ddf5efmr10217850ejc.5.1678096974786; 
 Mon, 06 Mar 2023 02:02:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+TAOPPKUN8HonfEHJITX8DKCsM38RsY0wd4bbkhM8CMO9H9EO6enQL03mIUZL6q1xipccmKA==
X-Received: by 2002:a17:906:9c8b:b0:8b1:76dd:f5ef with SMTP id
 fj11-20020a1709069c8b00b008b176ddf5efmr10217828ejc.5.1678096974463; 
 Mon, 06 Mar 2023 02:02:54 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 p7-20020a170906140700b008ce5b426d77sm4439612ejc.13.2023.03.06.02.02.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 02:02:53 -0800 (PST)
Message-ID: <a9ac850f-ffd4-0771-147e-bf7385483043@redhat.com>
Date: Mon, 6 Mar 2023 11:02:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 00/16] win32: do not mix SOCKET and fd space
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, armbru@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Hanna Reitz <hreitz@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
 <CAMxuvawu4EWKpw_8sHGU-hVKeX_wZzpWqaRJo6kjbkYB45VWjw@mail.gmail.com>
 <cd4d82c4-6161-493b-073b-235141d6337a@redhat.com>
 <CAMxuvawL9VEGC5HL9OMwXhxeVY_qSKFfORsMaW9OeV=tQ0OH1A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAMxuvawL9VEGC5HL9OMwXhxeVY_qSKFfORsMaW9OeV=tQ0OH1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 3/6/23 09:08, Marc-André Lureau wrote:
> Great, thanks! (I suppose you'll drop "RFC: build-sys: add slirp.wrap", 
> and perhaps queue the other meson/wrap series instead)

I don't have time to test the dtc fallback in CI, so I'll queue only the 
first three patches and note it as experimental in the release notes.

In the next release we'll probably have pip support in configure, so 
perhaps we can make the --wrap-mode option conditional.

Paolo


