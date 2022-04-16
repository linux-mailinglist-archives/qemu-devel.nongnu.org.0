Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4CF5036A2
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Apr 2022 14:39:12 +0200 (CEST)
Received: from localhost ([::1]:49422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfhhn-0004CN-02
	for lists+qemu-devel@lfdr.de; Sat, 16 Apr 2022 08:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nfhgF-0003UZ-9C
 for qemu-devel@nongnu.org; Sat, 16 Apr 2022 08:37:35 -0400
Received: from smtp58.i.mail.ru ([217.69.128.38]:36890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nfhgC-0002N3-Ve
 for qemu-devel@nongnu.org; Sat, 16 Apr 2022 08:37:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=Er7i73WSlZixNkeHiMn7fcT9u+7Boz6Za8dBXYRW+ZU=; 
 t=1650112653;x=1650718053; 
 b=bVuAnDw5Pxp1lc1+yK8K214/2x28OHHe1LLw3lk6cq5GVnKazv2uhZcorBbd3LbUBkkgu+ciXG0CZOI9LAUT3PcKA3jg8V3giAYKXVr72gv9WpTmEUklMnd4FZiSanUNJ+9YwOxmZb2mPjcNFZgWL8m4BzNOioG6cZntIK2fmGkC1Pnzzd7KGV0tktbyg4CY0e+DkowCAdlMXORkn/uw9r1/mhoPsmU2sK4CbCzRpn83eNR08XHHXEC/wzB1amn4eyhcHVWvkgCZc7yy3sv2y6CBT13w61fmpS0D1chfU9oBP0nwonFyePvN4H+lkquoO2hKaof7cXcn0UhrnkQ+Ow==;
Received: by smtp58.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nfhg9-0000NA-1X; Sat, 16 Apr 2022 15:37:29 +0300
Message-ID: <2fe67c67-bffa-078c-d16a-a63d2736ba7d@mail.ru>
Date: Sat, 16 Apr 2022 15:37:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 for-7.1 6/9] nbd: code motion and function renaming
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eblake@redhat.com
References: <20220414175756.671165-1-pbonzini@redhat.com>
 <20220414175756.671165-7-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220414175756.671165-7-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp58.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD95A798FEA17BE68F0750D514B51AA9BD1D5B6D06565E552D9182A05F5380850404C228DA9ACA6FE27B745D65330B294C161CA9B15C12E07D77AB3EED27244238CE8399C8C6B2D8F5D
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE76C0A440987CA342DC2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE7922E451CE6E839B1EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BEBC5CAB6D411FFA6268EC88432B14012CE46FD37C1332A1520879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C073F899D3F2D9BF0D8941B15DA834481FA18204E546F3947C2FFDA4F57982C5F4F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063783E00425F71A4181389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F790063789AE0CFEAB31AB47D32BA5DBAC0009BE395957E7521B51C20BC6067A898B09E4090A508E0FED6299176DF2183F8FC7C0B29B1280B85899A3CD04E86FAF290E2D7E9C4E3C761E06A71DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B627FB1C3B46BEE1FF089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A50015CDF18A8B223D99DB86B87F4DA17960CFD7C4F18AE52BD59269BC5F550898D99A6476B3ADF6B4886A5961035A09600383DAD389E261318FB05168BE4CE3AF
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D346EDE9E12965E8CD50A68C6EA3F81005714E818299B9DB9FCE02616B917B2057A0CB8D1092A41BDD71D7E09C32AA3244CE4948A8CBEAA276D95E793349506DF1D30452B15D76AEC14FACE5A9C96DEB163
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojOmri57mKkPDpRkjux4zWfA==
X-Mailru-Sender: 6C3E74F07C41AE946BC06F16BD5C3913CE02F1706A3806E2B11BBD4314DA0B68B4934413F0E5D243E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=217.69.128.38;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp58.i.mail.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

14.04.2022 20:57, Paolo Bonzini wrote:
> Prepare for the next patch, so that the diff is less confusing.
> 
> nbd_client_connecting is moved closer to the definition point.

Amm. To usage-point you mean?
The original idea was to keep simple state-reading helpers definitions together :)

> 
> nbd_client_connecting_wait() is kept only for the reconnection
> logic; when it is used to check if a request has to be reissued,
> use the renamed function nbd_client_will_reconnect().  In the
> next patch, the two cases will have different locking requirements.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

> ---
>   block/nbd.c | 24 ++++++++++++++----------
>   1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index a2414566d1..37d466e435 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -254,18 +254,15 @@ static void open_timer_init(BDRVNBDState *s, uint64_t expire_time_ns)
>       timer_mod(s->open_timer, expire_time_ns);
>   }
>   
> -static bool nbd_client_connecting(BDRVNBDState *s)
> -{
> -    NBDClientState state = qatomic_load_acquire(&s->state);
> -    return state == NBD_CLIENT_CONNECTING_WAIT ||
> -        state == NBD_CLIENT_CONNECTING_NOWAIT;
> -}
> -
>   static bool nbd_client_connecting_wait(BDRVNBDState *s)
>   {
>       return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
>   }
>   
> +static bool nbd_client_will_reconnect(BDRVNBDState *s)
> +{
> +    return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
> +}
>   /*
>    * Update @bs with information learned during a completed negotiation process.
>    * Return failure if the server's advertised options are incompatible with the
> @@ -355,6 +352,13 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
>       return 0;
>   }
>   
> +static bool nbd_client_connecting(BDRVNBDState *s)
> +{
> +    NBDClientState state = qatomic_load_acquire(&s->state);
> +    return state == NBD_CLIENT_CONNECTING_WAIT ||
> +        state == NBD_CLIENT_CONNECTING_NOWAIT;
> +}
> +
>   /* Called with s->requests_lock taken.  */
>   static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>   {
> @@ -1190,7 +1194,7 @@ static int coroutine_fn nbd_co_request(BlockDriverState *bs, NBDRequest *request
>               error_free(local_err);
>               local_err = NULL;
>           }
> -    } while (ret < 0 && nbd_client_connecting_wait(s));
> +    } while (ret < 0 && nbd_client_will_reconnect(s));
>   
>       return ret ? ret : request_ret;
>   }
> @@ -1249,7 +1253,7 @@ static int coroutine_fn nbd_client_co_preadv(BlockDriverState *bs, int64_t offse
>               error_free(local_err);
>               local_err = NULL;
>           }
> -    } while (ret < 0 && nbd_client_connecting_wait(s));
> +    } while (ret < 0 && nbd_client_will_reconnect(s));
>   
>       return ret ? ret : request_ret;
>   }
> @@ -1407,7 +1411,7 @@ static int coroutine_fn nbd_client_co_block_status(
>               error_free(local_err);
>               local_err = NULL;
>           }
> -    } while (ret < 0 && nbd_client_connecting_wait(s));
> +    } while (ret < 0 && nbd_client_will_reconnect(s));
>   
>       if (ret < 0 || request_ret < 0) {
>           return ret ? ret : request_ret;


-- 
Best regards,
Vladimir

