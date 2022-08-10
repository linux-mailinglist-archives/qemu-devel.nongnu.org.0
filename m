Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0023758ED16
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:24:54 +0200 (CEST)
Received: from localhost ([::1]:57882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLlhd-0004Wk-Rn
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oLlJn-00056E-CE
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:00:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oLlJh-0001Fs-8W
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:00:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660136408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aYnaV66sa0a2V2Cnk5jucBF9tWx62sohU+rJHOJK92g=;
 b=Y1QWgTTppeTrOOx4nZXBH1xOo8onxO5cT56sfhnoo8SyElfKMUe6hcHYaje2VdkcxSfZdU
 H9dcrUjD7AEbilfJ120VNT5crrZCCt0UGMAQQBYvV760XkPSgMFUpoCQWrioB9mBQnRVOL
 8qBV82EafW8SQZ5XFlmPQqMeQjh9jVM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-JcrVSnj9Pu-WUXiRHeG_5w-1; Wed, 10 Aug 2022 09:00:06 -0400
X-MC-Unique: JcrVSnj9Pu-WUXiRHeG_5w-1
Received: by mail-wm1-f69.google.com with SMTP id
 n19-20020a05600c3b9300b003a314062cf4so1827574wms.0
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 06:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=aYnaV66sa0a2V2Cnk5jucBF9tWx62sohU+rJHOJK92g=;
 b=HSnlSBFTZ8MLLnLuN6nZEmJLWIDX4ihIkeEZkv1I2p4mpJTFa8/Ziz5vZdrr6P5Wer
 z4gKbSbjMR0tf+R279+TlGKuqfyDQw8zG1SebxuP0O+Ax+G72qh0Lkp6/7kaxudRvUrG
 IneDhFxZchJqftFvNNnErZCvKb33GvdgiQQYMJA016Go5Kkygu6asMauhgzdbGwIHf4P
 f5zz/cEd2QTtXFBvHH5M81z0KV0+evvyliOH4MBtsFrD/5pGK4zBDlHs5wOdJhnmiIlE
 ZIMf1O/rQchzPpoB3bvnOPpeZVQbQhtLW3VVU9bLDp8R9TXw71PjJu1M0h0jolvJJ5PN
 FGwA==
X-Gm-Message-State: ACgBeo3rvoGth2EZt1ZzRa2k3Sez/mzZU1aSqgC2DDv5zi1FD570ozaE
 m+00raV7FXQOJL9r+K4bCIB3WCi+6uvU8fp0lWI+HpEoJAyLkpeSyIZZiu4U6fxZKEowwRMVBP3
 wyF6NI1V4LCLsLv4=
X-Received: by 2002:a1c:f607:0:b0:3a0:3dc9:c4db with SMTP id
 w7-20020a1cf607000000b003a03dc9c4dbmr2442882wmc.30.1660136405630; 
 Wed, 10 Aug 2022 06:00:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR78JTMz2aWU7uzyqkbbQrPK5uHJmEdesdlfKQIlSxsCVY1U/VyRk36lKcIANEnrcuMF+tcHIA==
X-Received: by 2002:a1c:f607:0:b0:3a0:3dc9:c4db with SMTP id
 w7-20020a1cf607000000b003a03dc9c4dbmr2442861wmc.30.1660136405373; 
 Wed, 10 Aug 2022 06:00:05 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:1600:a3ce:b459:ef57:7b93?
 (p200300cbc7071600a3ceb459ef577b93.dip0.t-ipconnect.de.
 [2003:cb:c707:1600:a3ce:b459:ef57:7b93])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a056000124100b0021d221daccfsm16493954wrx.78.2022.08.10.06.00.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 06:00:05 -0700 (PDT)
Message-ID: <b7146c93-36a2-dff0-9d33-291fddd14d9b@redhat.com>
Date: Wed, 10 Aug 2022 15:00:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/3] softmmu/physmem: Remove the ifdef __linux__ around
 the pagesize functions
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Claudio Imbrenda <imbrenda@linux.ibm.com>
References: <20220810125720.3849835-1-thuth@redhat.com>
 <20220810125720.3849835-3-thuth@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220810125720.3849835-3-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 10.08.22 14:57, Thomas Huth wrote:
> Now that host_memory_backend_pagesize() is not depending on the hugetlb
> memory path handling anymore, we can also remove the #ifdef and the
> TOCTTOU comment from the calling functions - the code should now work
> equally well on all host architectures.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  softmmu/physmem.c | 17 -----------------
>  1 file changed, 17 deletions(-)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index dc3c3e5f2e..50231bab30 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -1331,13 +1331,6 @@ GString *ram_block_format(void)
>      return buf;
>  }
>  
> -#ifdef __linux__
> -/*
> - * FIXME TOCTTOU: this iterates over memory backends' mem-path, which
> - * may or may not name the same files / on the same filesystem now as
> - * when we actually open and map them.  Iterate over the file
> - * descriptors instead, and use qemu_fd_getpagesize().
> - */
>  static int find_min_backend_pagesize(Object *obj, void *opaque)
>  {
>      long *hpsize_min = opaque;
> @@ -1391,16 +1384,6 @@ long qemu_maxrampagesize(void)
>      object_child_foreach(memdev_root, find_max_backend_pagesize, &pagesize);
>      return pagesize;
>  }
> -#else
> -long qemu_minrampagesize(void)
> -{
> -    return qemu_real_host_page_size();
> -}
> -long qemu_maxrampagesize(void)
> -{
> -    return qemu_real_host_page_size();
> -}
> -#endif
>  
>  #ifdef CONFIG_POSIX
>  static int64_t get_file_size(int fd)

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


