Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE3E5F524A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 12:11:16 +0200 (CEST)
Received: from localhost ([::1]:40512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og1Mw-0005vM-0k
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 06:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1og1KO-0003yv-1K
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 06:08:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1og1KK-0008Ar-W4
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 06:08:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664964511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zAUXyKl73wvxH6iP5g5JRgZ09WOzvBwOJcwH8n4Jo6I=;
 b=c+TZo7yhNW9i0t2QVZStJiu68tPRRRnawQInXcHAac8oQ0S1l+n/PmJ/inobWEWjDU0Lvd
 P8X4B1fs2iqJr5V4dH3q9phCVV7w+R5edzm5XIy0fwbpj+kPFJT9lajMkpi0FuI8gvnu69
 96mXtpguSyJqFRQK2Hz2XHQKzOq1B7M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-151-Q2GFCyVFOy6Xp2wzYgt2GA-1; Wed, 05 Oct 2022 06:08:30 -0400
X-MC-Unique: Q2GFCyVFOy6Xp2wzYgt2GA-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay21-20020a05600c1e1500b003b45fd14b53so899195wmb.1
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 03:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=zAUXyKl73wvxH6iP5g5JRgZ09WOzvBwOJcwH8n4Jo6I=;
 b=goHazRAj59msgvp0Yjvn+j2brjoaSZY5CYEI54taeo0UmU5zLV+Qzb4Es/v4+ACT55
 T17P3YlKhIeqmQ1mEw221rZd8Muvo5DUTOO1hZ/AR1eyoD9FScE6/pt8KKxbC17R9xdz
 p8vO/ELa40hsZoQImkPgBFg/4TJBOCkMMlmxXeipx/5wj94yrc3l9FpAv/gB0U650jqU
 XxMa05f/M6K7hQWoqBeHwya1jTkgldL8OMzvmNxB33xOYEUfhrnC+poFy/c7QbbkBoI9
 VahcCYD2Tn5igHDNbWHnugi+LGHuI/E6HkU1F2GLztHkcYpHWMeZs0NJpWvD4xTk0aHr
 K1PA==
X-Gm-Message-State: ACrzQf0w5GMRjas3f/6LJQX5gY3a5g6wOSazL2sgIl1frweGaDW/SyRx
 58etxC3qa4vLGKz29Vv53I6u9vOYSHRFOtS0GfxWdELLb0IOR08awION2FzRtTd7yh6DubVJb1L
 gc2O0OsJkvCbIAWo=
X-Received: by 2002:a5d:504a:0:b0:22e:3edd:3c86 with SMTP id
 h10-20020a5d504a000000b0022e3edd3c86mr8734005wrt.360.1664964509601; 
 Wed, 05 Oct 2022 03:08:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6zWoTx8NupGDXH1ksvi5bgEE4l7HhB0ptt67d3VMnvmpAxl4iA56quMg7U2e+8j5X8Xb0TGQ==
X-Received: by 2002:a5d:504a:0:b0:22e:3edd:3c86 with SMTP id
 h10-20020a5d504a000000b0022e3edd3c86mr8733987wrt.360.1664964509342; 
 Wed, 05 Oct 2022 03:08:29 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 w7-20020adfde87000000b0022afedf3c87sm14572919wrl.105.2022.10.05.03.08.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Oct 2022 03:08:28 -0700 (PDT)
Message-ID: <bb04fbf9-f72c-31a5-a017-e519a701302d@redhat.com>
Date: Wed, 5 Oct 2022 12:08:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v9 05/16] qapi: net: add stream and dgram netdevs
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Greg Kurz <groug@kaod.org>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
References: <20220926195048.487915-1-lvivier@redhat.com>
 <20220926195048.487915-6-lvivier@redhat.com> <YzPh5fhlDgbgddVv@yekko>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <YzPh5fhlDgbgddVv@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.449, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/22 07:55, David Gibson wrote:
>> +static int net_stream_server_init(NetClientState *peer,
>> +                                  const char *model,
>> +                                  const char *name,
>> +                                  SocketAddress *addr,
>> +                                  Error **errp)
>> +{
>> +    NetClientState *nc;
>> +    NetStreamState *s;
>> +    int fd, ret;
>> +
>> +    switch (addr->type) {
>> +    case SOCKET_ADDRESS_TYPE_INET: {
>> +        struct sockaddr_in saddr_in;
>> +
>> +        if (convert_host_port(&saddr_in, addr->u.inet.host, addr->u.inet.port,
>> +                              errp) < 0) {
>> +            return -1;
>> +        }
>> +
>> +        fd = qemu_socket(PF_INET, SOCK_STREAM, 0);
>> +        if (fd < 0) {
>> +            error_setg_errno(errp, errno, "can't create stream socket");
>> +            return -1;
>> +        }
>> +        qemu_socket_set_nonblock(fd);
>> +
>> +        socket_set_fast_reuse(fd);
>> +
>> +        ret = bind(fd, (struct sockaddr *)&saddr_in, sizeof(saddr_in));
>> +        if (ret < 0) {
>> +            error_setg_errno(errp, errno, "can't bind ip=%s to socket",
>> +                             inet_ntoa(saddr_in.sin_addr));
>> +            closesocket(fd);
>> +            return -1;
>> +        }
>> +        break;
>> +    }
>> +    case SOCKET_ADDRESS_TYPE_FD:
>> +        fd = monitor_fd_param(monitor_cur(), addr->u.fd.str, errp);
>> +        if (fd == -1) {
>> +            return -1;
>> +        }
>> +        ret = qemu_socket_try_set_nonblock(fd);
>> +        if (ret < 0) {
>> +            error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
>> +                             name, fd);
>> +            return -1;
>> +        }
>> +        break;
>> +    default:
>> +        error_setg(errp, "only support inet or fd type");
>> +        return -1;
>> +    }
>> +
>> +    ret = listen(fd, 0);
> Does this make sense for a passed in fd?  If someone passes a "server"
> fd, are they likely to be passing a socket on which bind() but not
> listen() has been called?  Or one on which both bind() and listen()
> have been called?
> 

Original code in net/socket.c doesn't manage server case with fd.

So I have checked what is done for QIO (all this code is overwritten by patch introducing 
QIO anyway):

At the end of the series, we use qio_channel_socket_listen_async() in 
net_stream_server_init(), that in the end calls socket_listen().

With SOCKET_ADDRESS_TYPE_FD we does the listen() (without bind()) with the following comment:

     case SOCKET_ADDRESS_TYPE_FD:
         fd = socket_get_fd(addr->u.fd.str, errp);
         if (fd < 0) {
             return -1;
         }

         /*
          * If the socket is not yet in the listen state, then transition it to
          * the listen state now.
          *
          * If it's already listening then this updates the backlog value as
          * requested.
          *
          * If this socket cannot listen because it's already in another state
          * (e.g. unbound or connected) then we'll catch the error here.
          */
         if (listen(fd, num) != 0) {
             error_setg_errno(errp, errno, "Failed to listen on fd socket");
             closesocket(fd);
             return -1;
         }
         break;

So I think we should keep the listen() in our case too.

Thanks,
Laurent


