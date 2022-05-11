Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D4A5237E2
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 17:57:10 +0200 (CEST)
Received: from localhost ([::1]:47514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nooi5-0008Fj-BD
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 11:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1noofz-0006q1-4c
 for qemu-devel@nongnu.org; Wed, 11 May 2022 11:54:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1noofv-0003eP-Nb
 for qemu-devel@nongnu.org; Wed, 11 May 2022 11:54:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652284494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9vRH2GrRM1RWyhFq/kJY+bFvteUEcQiY/CYEYb+181o=;
 b=edZwW9zKGx5+9cqmHQomK8ZpLszAmACHsCT/4J4qaVI/QKJ+bAXfnkAr6lg8bsYiwOxzMa
 mf8zTlLcApfF0QfunVToFNmtN1oIthYkstr2+PTKcSOXYunnk7ESDFSMXYUD7H8JIY5xvC
 1tVLKPr6irpak9pf3tLBochRgtx8vbM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-cMD7dtUOMAC1vQV5i2aQiQ-1; Wed, 11 May 2022 11:54:53 -0400
X-MC-Unique: cMD7dtUOMAC1vQV5i2aQiQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 k13-20020a05621414ed00b0045ae9344714so2327815qvw.8
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 08:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9vRH2GrRM1RWyhFq/kJY+bFvteUEcQiY/CYEYb+181o=;
 b=0P0yabHN49rIgx7MW7DaWnjLWasJ2F3/powSggsi2X/7JtEEoEqopiXPfR4tdZr60F
 aMvCHVJW8xOz5jl/Rz8GrMR5MT9VxFkMBAImwf9k1dm7lCLYXYC51xJAahNN6v8OUn1b
 gxlMhO1sn3H9N3oGAGyCAguTkVMAIprnBv1sK83iTHE9hyE2hq+bFpjnGHxxXhhpZa6I
 AUp5udWH1CcuCrwAgTehD2LWX6kLtyTRNkmVOX7QZ9IsFDcDrursPqYX4yhqr/UKTP1k
 x4yC1tjMct6iOTpVNEptFELcjKjGLyg5Bgfd9oee2DZKhCQxzgubapDit143JlckEYGn
 Q11Q==
X-Gm-Message-State: AOAM531g6xupDBrnr7QiL4sliJ5b7lquKUYf/vSGiGTbiz/ZWSddbGCf
 +8mIjohnfgSzCDR7OaQwiYamnHspj8Q8cznOp29ZnuEjNB8QwRc6vVHvGuEy44sPQzSeRWP04Rl
 Xfmqz3CDwHLJfRDw=
X-Received: by 2002:a05:622a:109:b0:2f3:b80b:6819 with SMTP id
 u9-20020a05622a010900b002f3b80b6819mr24707422qtw.141.1652284492930; 
 Wed, 11 May 2022 08:54:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwGh2KJw3O2qmkbKKQ52KxOaTon/02Mf/bb2K8ushDQ4h/yuTpQ4MtPSA8NTMByLaxJJL7Qg==
X-Received: by 2002:a05:622a:109:b0:2f3:b80b:6819 with SMTP id
 u9-20020a05622a010900b002f3b80b6819mr24707404qtw.141.1652284492655; 
 Wed, 11 May 2022 08:54:52 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.21.186])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a05620a13d800b0069fe1fc72e7sm1445991qkl.90.2022.05.11.08.54.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 08:54:52 -0700 (PDT)
Message-ID: <b3461987-d369-edee-91c0-dcafa2b8297a@redhat.com>
Date: Wed, 11 May 2022 17:54:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH 1/6] net: introduce convert_host_port()
Content-Language: en-US
To: Stefano Brivio <sbrivio@redhat.com>
Cc: qemu-devel@nongnu.org, Ralph Schmieder <ralph.schmieder@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20220509173618.467207-1-lvivier@redhat.com>
 <20220509173618.467207-2-lvivier@redhat.com>
 <20220510232407.6639cace@elisabeth>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20220510232407.6639cace@elisabeth>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 10/05/2022 23:24, Stefano Brivio wrote:
> On Mon,  9 May 2022 19:36:13 +0200
> Laurent Vivier <lvivier@redhat.com> wrote:
> 
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>>   include/qemu/sockets.h |  2 ++
>>   net/net.c              | 62 ++++++++++++++++++++++--------------------
>>   2 files changed, 34 insertions(+), 30 deletions(-)
>>
>> diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
>> index 038faa157f59..47194b9732f8 100644
>> --- a/include/qemu/sockets.h
>> +++ b/include/qemu/sockets.h
>> @@ -47,6 +47,8 @@ void socket_listen_cleanup(int fd, Error **errp);
>>   int socket_dgram(SocketAddress *remote, SocketAddress *local, Error **errp);
>>   
>>   /* Old, ipv4 only bits.  Don't use for new code. */
>> +int convert_host_port(struct sockaddr_in *saddr, const char *host,
>> +                      const char *port, Error **errp);
>>   int parse_host_port(struct sockaddr_in *saddr, const char *str,
>>                       Error **errp);
>>   int socket_init(void);
>> diff --git a/net/net.c b/net/net.c
>> index a094cf1d2929..58c05c200622 100644
>> --- a/net/net.c
>> +++ b/net/net.c
>> @@ -66,55 +66,57 @@ static QTAILQ_HEAD(, NetClientState) net_clients;
>>   /***********************************************************/
>>   /* network device redirectors */
>>   
>> -int parse_host_port(struct sockaddr_in *saddr, const char *str,
>> -                    Error **errp)
>> +int convert_host_port(struct sockaddr_in *saddr, const char *host,
>> +                      const char *port, Error **errp)
>>   {
>> -    gchar **substrings;
>>       struct hostent *he;
>> -    const char *addr, *p, *r;
>> -    int port, ret = 0;
>> +    const char *r;
>> +    long p;
>>   
>>       memset(saddr, 0, sizeof(*saddr));
>>   
>> -    substrings = g_strsplit(str, ":", 2);
>> -    if (!substrings || !substrings[0] || !substrings[1]) {
>> -        error_setg(errp, "host address '%s' doesn't contain ':' "
>> -                   "separating host from port", str);
>> -        ret = -1;
>> -        goto out;
>> -    }
>> -
>> -    addr = substrings[0];
>> -    p = substrings[1];
>> -
>>       saddr->sin_family = AF_INET;
>> -    if (addr[0] == '\0') {
>> +    if (host[0] == '\0') {
>>           saddr->sin_addr.s_addr = 0;
>>       } else {
>> -        if (qemu_isdigit(addr[0])) {
>> -            if (!inet_aton(addr, &saddr->sin_addr)) {
>> +        if (qemu_isdigit(host[0])) {
>> +            if (!inet_aton(host, &saddr->sin_addr)) {
> 
> I was about to observe that this doesn't support IPv6 addresses (which
> I guess we'd like to have always in the RFC 3986 form "[address]:port",
> as the port is mandatory here), and to propose a small change to bridge
> this gap.
> 
> Then I realised this is (partially) using GLib, so maybe we want to use
> g_network_address_parse() which would, however, give us a
> GSocketConnectable object.
> 
> At that point, do we want to pass the GsocketConnectable thing around,
> or stick to struct sockaddr_in{,6}, filling it here from what GLib
> gives us?
> 

For the new netdev, we should better switch to util/qemu-sockets.c functions that take 
directly a SocketAddress (see socket_connect()).

Thanks,
Laurent


